package cli

import (
	"errors"
	"fmt"
	"github.com/c-bata/go-prompt"
	"github.com/button-tech/ton-sync-payments-channel/client_go"
	"github.com/button-tech/ton-sync-payments-channel/client_go/config"
	"github.com/button-tech/ton-sync-payments-channel/client_go/messages"
	"github.com/button-tech/ton-sync-payments-channel/client_go/paychannel"
	"log"
	"os"
	"os/exec"
	"strconv"
	"strings"
	"time"
)

const (
	help = `serve			 create connection token
connect			 connect to other peer
deposit			 make deposit
send			 send some amount
sign			 sign last state
balanceContract          show balance of contract in workchain
balanceChan	         show balance in sync chan
balanceTon               show balance in workchain
getAccount               show user ton account
getPartnerAccount        show partner ton account
getSmartContractAccount  show smart contract address
getSeqno                 show seqno of your acc in workchain
createEmpty 		 create empty state
requestEmpty		 request empty state from your partner
showAll			 show all states
showLast		 show last state
withdrawal                 push actual state in to workchain
exit			 exit from app
`
)

var LivePrefixState struct {
	LivePrefix string
	IsEnable   bool
}


func getSmartContractAddress() string {
	for {
		fmt.Print("Enter smart contract address: ")

		var smartAddress string

		fmt.Scan(&smartAddress)

		if len(smartAddress) == 48 || len(smartAddress) == 66 {
			return smartAddress
		} else {
			fmt.Println("Not valid address!")
		}
	}
}


func New() {

	fmt.Println(" --------------------------------------------")
	fmt.Println("|Welcome to the sync channel from BUTTON Team|")
	fmt.Println(" --------------------------------------------")

	paychannel.SmartContractAddress = getSmartContractAddress()
	paychannel.AccountAddress = getAddress()

	fmt.Println("\n\nYour address: " + paychannel.AccountAddress)
	fmt.Println("Smart contract address: " + paychannel.SmartContractAddress)

	p := prompt.New(
		executor,
		completer,
		prompt.OptionPrefix("--> "),
		prompt.OptionInputTextColor(prompt.Yellow),
	)
	p.Run()
}

func executor(userText string) {
	if !backend.ConnectionDetected {
		if userText == "connect" {
			fmt.Print("Enter connection string: ")
			var dest string
			fmt.Scan(&dest)
			go backend.P2PConnect(dest)
			time.Sleep(time.Second * 1)

		} else if userText == "serve" {
			if is := serve(); !is {
				return
			}
		} else if userText == "exit" {
			os.Exit(1)
		} else {
			backend.PrettyPrint("Wait connections")
			return
		}
	}

	if userText == "exit" {
		backend.PrettyPrint("Bye!")
		os.Exit(0)
	}

	args := strings.Split(userText, " ")
	switch args[0] {
	case "send":
		if len(paychannel.ClientCreated.States.Storage) == 0 {
			return
		}
		if len(args) != 2 {
			backend.PrettyPrint("Turn amount to send")
			return
		}

		amount, err := strconv.ParseFloat(args[1], 64)
		if err != nil {
			backend.PrettyPrint("Incorrect amount")
			return
		}

		if amount <= 0 {
			backend.PrettyPrint("Please enter amount above 0")
			return
		}

		send(amount)

	case "sign":
		if len(paychannel.ClientCreated.States.Storage) == 0 {
			return
		}

		if paychannel.ClientCreated.SignLastState() {
			clientData := paychannel.ClientCreated.ReadStatesToSend()
			backend.WriteCommandToChannel(&clientData, messages.SignCMD)
		}

	case "createEmpty":
		if len(paychannel.ClientCreated.States.Storage) == 0 {
			return
		}

		if paychannel.ClientCreated.IsClientReadyToSend() {
			backend.PrettyPrint("Wait your turn, or make requestEmpty")
			return
		}

		paychannel.ClientCreated.CreateEmptyState()
		clientData := paychannel.ClientCreated.ReadStatesToSend()
		backend.WriteCommandToChannel(&clientData, messages.ResponseNewStateCMD)

	case "requestEmpty":
		if len(paychannel.ClientCreated.States.Storage) == 0 {
			return
		}
		backend.WriteCommandToChannel(nil, messages.RequestEmptyStateCMD)

	case "showAll":
		if len(paychannel.ClientCreated.States.Storage) == 0 {
			return
		}
		backend.PrettyPrint(paychannel.ClientCreated.FormatAllStatesToView())

	case "showLast":
		if len(paychannel.ClientCreated.States.Storage) == 0 {
			return
		}
		backend.PrettyPrint(paychannel.ClientCreated.ReadLastOrDefault().FormatToView())


	case "balanceChan":
		if len(paychannel.ClientCreated.States.Storage) == 0 {
			return
		}
		backend.PrettyPrint(paychannel.ClientCreated.FormatBalanceToView())

	case "exitFromDeal":
		if len(paychannel.ClientCreated.States.Storage) == 0 {
			return
		}
		if paychannel.ClientCreated.CheckSignatures() {
			backend.PrettyPrint("First, sign state")
			return
		}
		clientData := paychannel.ClientCreated.ReadStatesToSend()
		backend.WriteCommandToChannel(&clientData, messages.RequestExitCMD)

	case "approveExit":
		if len(paychannel.ClientCreated.States.Storage) == 0 {
			return
		}
		if paychannel.ClientCreated.CheckSignatures() {

		}
		clientData := paychannel.ClientCreated.ReadStatesToSend()
		backend.WriteCommandToChannel(&clientData, messages.ResponseExitCMD)
		backend.PrettyPrint(clientData.Pending.FormatToView())

	case "deposit":
		amount, err := sendGramsToContract()
		if err != nil{
			fmt.Println(err)
			backend.PrettyPrint("Sorry, transaction was revert")
			return
		}

		tonBalance, err := getTonBalance(paychannel.AccountAddress)
		if err != nil{
			fmt.Println(err)
			return
		}

		fmt.Println("Account balance in workchain: " +  convertToGrams(tonBalance) + " Gram\n")
		fmt.Printf("Account balance in sync chan: %f\n", amount)

		var (
			data    paychannel.ClientData
			message string
		)

		if paychannel.ClientCreated.IsClientA() {
			paychannel.ClientCreated.CreateInitialState(amount, 0)
			state := paychannel.ClientCreated.ReadLastOrDefault()
			data = paychannel.ClientData{
				Pending: state,
				Signed:  nil,
			}
			message = messages.InitialCMD
		} else {
			data = paychannel.ClientCreated.ReadStatesToSend()
			data.Pending.BalanceB = amount
			paychannel.ClientCreated.UpdateLastStateSignatures(data.Pending)
			message = messages.InitialCMDB
		}
		backend.WriteCommandToChannel(&data, message)

	case "balanceTon":
		tonBalance, err := getTonBalance(paychannel.AccountAddress)
		if err != nil {
			log.Println(err)
		} else {
			backend.PrettyPrint("Account balance in workchain: " + convertToGrams(tonBalance) + " Gram")
		}
	case "balanceContract":
		tonBalance, err := getTonBalance(paychannel.SmartContractAddress)
		if err != nil {
			log.Println(err)
		} else {
			backend.PrettyPrint("Account balance in workchain: " + convertToGrams(tonBalance) + " Gram")
		}

	case "getSeqno":
		seqno, err := getSeqno(paychannel.AccountAddress)
		if err != nil{
			log.Println(err)
		} else {
			backend.PrettyPrint("Seqno of your account: " + seqno)
		}

	case "getAccount":
		fmt.Println(paychannel.AccountAddress)

	case "getPartnerAccount":
		if len(paychannel.PartnerAddress) == 0 {
			return
		}

		fmt.Println(paychannel.PartnerAddress)
	case "getSmartContractAccount":
		fmt.Println(paychannel.SmartContractAddress)

	case "withdrawal":
		if len(paychannel.ClientCreated.States.Storage) == 0 {
			return
		}

		fmt.Print("Enter step number: ")

		var step string

		fmt.Scan(&step)

		stepInt, err := strconv.Atoi(step)
		if err != nil{
			fmt.Println("Not valid step")
			return
		}

		if stepInt > 0 && stepInt <= len(paychannel.ClientCreated.States.Storage){
			err := sendStateToTheSmart(step, stepInt)
			if err != nil{
				fmt.Println(err)
				return
			}
		}

		go func() {
			for{
				contractStatus := getContractStatus()
				if contractStatus == "1197831206" {
					accountBalance, _ := getTonBalance(paychannel.AccountAddress)
					smartBalance, _ := getTonBalance(paychannel.SmartContractAddress)
					fmt.Println("Success withdrawal!")
					fmt.Println("Your balance in workchain now: " + convertToGrams(accountBalance))
					fmt.Println("Smart contract balance in workchain now: " + convertToGrams(smartBalance))
					os.Exit(1)
				}
				time.Sleep(time.Second * 3)
			}
		}()

	case "serve","connect":
		return

	default:
		fmt.Print(help)
	}
}

func completer(d prompt.Document) []prompt.Suggest {
	w := d.GetWordBeforeCursor()
	if w == "" {
		return []prompt.Suggest{}
	}
	return prompt.FilterHasPrefix(initOptions, w, true)
}

func changeLivePrefix() (string, bool) {
	return LivePrefixState.LivePrefix, LivePrefixState.IsEnable
}

// listen
func serve() bool {
	correct := true
	for correct {
		fmt.Print("Please, enter a source port or enter \"exit\": ")

		var sourcePort string
		if _, err := fmt.Scan(&sourcePort); err != nil {
			backend.PrettyPrint("Choose correct port")
			continue
		}

		if sourcePort == "exit" {
			return false
		}

		sp, err := strconv.Atoi(sourcePort)
		if err != nil {
			backend.PrettyPrint("Error: choose correct port")
			continue
		}

		correct = false
		go backend.P2PServe(sp)
		backend.ConnectionDetected = true
		paychannel.ClientCreated = paychannel.InitClient("A")
		time.Sleep(time.Second * 1)
	}
	return true
}

func send(amount float64) {
	if paychannel.ClientCreated.IsClientReadyToSend() {
		backend.PrettyPrint("Wait your turn, or make requestEmpty")
		return
	}

	if paychannel.ClientCreated.CheckSignatures() {
		backend.PrettyPrint("First, sign state")
		return
	}

	lastState := paychannel.ClientCreated.ReadLastOrDefault()

	if paychannel.ClientCreated.IsClientA() {
		if lastState.BalanceA < amount {
			backend.PrettyPrint("Your balance is less than amount")
			return
		}
		paychannel.ClientCreated.CreateNewState(lastState.BalanceA-amount, lastState.BalanceB+amount)
	} else {
		if lastState.BalanceB < amount {
			backend.PrettyPrint("Your balance is less than amount")
			return
		}
		paychannel.ClientCreated.CreateNewState(lastState.BalanceA+amount, lastState.BalanceB-amount)
	}
	clientData := paychannel.ClientCreated.ReadStatesToSend()
	backend.WriteCommandToChannel(&clientData, messages.ResponseNewStateCMD)
}

func sendGramsToContract() (float64, error) {

	seqno, err := getSeqno(paychannel.AccountAddress)
	if err != nil{
		return 0, err
	}

	seqnoDec, err := strconv.Atoi(seqno)
	if err != nil{
		return 0, err
	}

	var amount string

	balance, err := getTonBalance(paychannel.AccountAddress)
	if err != nil {
		return  0, err
	}

	backend.PrettyPrint("Your account balance now: " + convertToGrams(balance) + " Gram")

	fmt.Print("Enter amount to put on contract or \"exit\": ")

	fmt.Scan(&amount)
	if amount == "exit" {
			return 0, errors.New("typed continue")
	}

	amountFloat, err := strconv.ParseFloat(amount, 64)
	if err != nil || amountFloat < 0 {
			backend.PrettyPrint("Incorrect amount")
			return 0, errors.New("incorrect amount")
	}

	err = deposit(amount, paychannel.SmartContractAddress, seqno, seqnoDec)
	if err != nil{
		return 0, err
	}


	return amountFloat, nil
}

func getAddress() string {
	stdout, err := exec.Command(
		config.Cfg.FiftCompiler,
		"-I",
		config.Cfg.FiftLib,
		config.Cfg.PathToScriptAccountAddress,
	).Output()

	if err != nil {
		log.Fatal(err)
	}

	address := strings.TrimSuffix(string(stdout), "\n")
	address = strings.Replace(address, "'", "\"", -1)
	return address
}

func getTonBalance(address string)(string, error){
	stdout, err := exec.Command(
		"./get_balance.py",
		address,
	).Output()
	if err != nil {
		return "", err
	}

	if string(stdout) == "error\n" {
		return "", err
	}

	balance := strings.TrimSuffix(string(stdout), "\n")
	balance = strings.Replace(balance, "'", "\"", -1)

	return balance, nil
}

func getSeqno(address string) (string, error) {

	stdout, err := exec.Command(
		"./get_seqno.py",
		address,
	).Output()
	if err != nil {
		return "", err
	}

	if string(stdout) == "error\n" {
		return "", err
	}

	seqno := strings.TrimSuffix(string(stdout), "\n")
	seqno = strings.Replace(seqno, "'", "\"", -1)

	return seqno, nil
}


func deposit(amount, smartAddress, seqno string, seqnoDec int) error {

	if err := exec.Command("./senddeposit.sh", smartAddress, seqno, amount).Run(); err != nil{
		return err
	}

	backend.PrettyPrint("Please wait...")

	time.Sleep(time.Second * 15)

	newSeqno, err := getSeqno(paychannel.AccountAddress)
	if err != nil{
		return  err
	}

	newSeqnoDec, err := strconv.Atoi(newSeqno)
	if err != nil{
		return  err
	}

	if newSeqnoDec > seqnoDec{
		return nil
	} else {
		time.Sleep(time.Second * 5)
		newSeqno, err = getSeqno(paychannel.AccountAddress)
		if err != nil{
			return  err
		}

		newSeqnoDec, err = strconv.Atoi(newSeqno)
		if err != nil{
			return  err
		}

		if newSeqnoDec > seqnoDec {
			return nil
		}
	}

	return errors.New("Tx revert")
}

func convertToGrams(balance string) string {
	balanceFloat, _ := strconv.ParseFloat(balance, 64)

	balanceFloat *= 0.000000001

	return strconv.FormatFloat(balanceFloat, 'f', 6, 64)
}

func getContractStatus() string {
	stdout, err := exec.Command(
		"./get_contract_status.py",
		paychannel.SmartContractAddress,
	).Output()
	if err != nil {
		return ""
	}

	if string(stdout) == "error\n" {
		return ""
	}

	status := strings.TrimSuffix(string(stdout), "\n")
	status = strings.Replace(status, "'", "\"", -1)

	return status
}

func sendStateToTheSmart(step string, stepInt int) error {

	state := paychannel.ClientCreated.States.Storage[stepInt - 1]

	signatureA := string(state.Signatures[0])
	signatureB := string(state.Signatures[1])

	balanceChanA := state.BalanceA
	balanceChanB := state.BalanceB

	firstSignature := paychannel.AccountSignature

	secondSignature := paychannel.PartnerSignature

	if !paychannel.ClientCreated.IsClientA(){
		s := secondSignature
		secondSignature = firstSignature
		firstSignature = s
	}


	if err := exec.Command("./create_signatures.sh", signatureA, signatureB, firstSignature, secondSignature).Run(); err != nil{
		return err
	}

	contractSeqno, err  := getSeqno(paychannel.SmartContractAddress)
	if err != nil{
		return err
	}

	fmt.Println("Signature A: " + signatureA)
	fmt.Println("Signature B: " + signatureB)
	fmt.Println("Balance A: " + strconv.FormatFloat(balanceChanA, 'f', 6, 64))
	fmt.Println("Balance B: " + strconv.FormatFloat(balanceChanB, 'f', 6, 64))
	fmt.Println("Account signature: " + paychannel.AccountSignature)
	fmt.Println("Partner signature: " + paychannel.PartnerSignature)
	fmt.Println("Step: " + step)
	fmt.Println("Contract seqno: " + contractSeqno)


	for {
		var result string
		fmt.Print("Are you sure[y/n]: ")
		fmt.Scan(&result)


		if result == "n"{
			return nil
		} else if result == "y" {

			firstAccount := paychannel.AccountAddress
			secondAccount := paychannel.PartnerAddress

			if !paychannel.ClientCreated.IsClientA() {
				s := secondAccount
				secondAccount = firstAccount
				firstAccount = s
			}

			if err := exec.Command(
				"./sendwithdraw.sh",
				contractSeqno,
				step,
				strconv.FormatFloat(balanceChanA, 'f', 6, 64),
				strconv.FormatFloat(balanceChanB, 'f', 6, 64),
				firstAccount,
				secondAccount,
				paychannel.SmartContractAddress,
			).Run(); err != nil{
				return nil
			}

			fmt.Println("Your state was sent to the smart contract")

			time.Sleep(time.Second * 15)
			newSeqno, _ := getSeqno(paychannel.SmartContractAddress)
			newSeqnoInt, _ := strconv.Atoi(newSeqno)
			oldSeqnoInt, _ := strconv.Atoi(contractSeqno)
			var c paychannel.ClientData
			c.ExitStep = step
			if newSeqnoInt > oldSeqnoInt {
				backend.WriteCommandToChannel(&c, messages.WithdrawalCMD)
			} else {
				time.Sleep(time.Second * 5)
				newSeqno, _ = getSeqno(paychannel.SmartContractAddress)
				newSeqnoInt, _ = strconv.Atoi(newSeqno)
				oldSeqnoInt, _ = strconv.Atoi(contractSeqno)
				if newSeqnoInt > oldSeqnoInt {
					backend.WriteCommandToChannel(&c, messages.WithdrawalCMD)
				} else {
					return errors.New("Transaction reverted!")
				}
			}

			return nil
		} else {
			continue
		}
	}
}