package paychannel

import (
	"fmt"
	"github.com/pkg/errors"
	"github.com/button-tech/ton-sync-payments-channel/client_go/config"
	"os/exec"
	"strconv"
	"strings"
)

var (
	ClientCreated *Client
	SmartContractAddress string
	AccountAddress string
	PartnerSignature string
	PartnerAddress string
	AccountSignature string
)

type Client struct {
	States        Storage
	Name          string
}

type ClientData struct {
	ExitStep string
	UserAddress string
	UserSignature string
	Pending       *State
	Signed        *State
}

func InitClient(name string) *Client {
	return &Client{
		States: CreateEmpty(),
		Name:   name,
	}
}

func (client *Client) InitBlockEnable() bool {
	if ClientCreated == nil {
		return false
	}
	if len(client.States.Storage) == 0 {
		return false
	}
	return true
}

func (client *Client) ReadAllStates() []State {
	return client.States.Storage
}

func (client *Client) ReadLastOrDefault() *State {
	storage := client.ReadAllStates()
	if len(storage) > 0 {
		return &storage[len(storage)-1]
	}
	return nil
}

func (client *Client) ReadBeforeLast() *State {
	storage := client.ReadAllStates()
	if len(storage) > 1 {
		return &storage[len(storage)-2]
	}
	return nil
}

func (client *Client) CreateEmptyState() *State {
	lastState := client.ReadLastOrDefault()

	newState := State{
		Step:     lastState.Step + 1,
		Sender:   client.Name,
		BalanceB: lastState.BalanceB,
		BalanceA: lastState.BalanceA,
	}
	newState.Signatures = append(make([][]byte, 0), client.generateSignature(newState))
	client.States.Storage = append(client.States.Storage, newState)
	return &newState
}

func (client *Client) CreateNewState(balanceA float64, balanceB float64) *State {
	lastState := client.ReadLastOrDefault()

	newState := State{
		Step:     lastState.Step + 1,
		Sender:   client.Name,
		BalanceA: balanceA,
		BalanceB: balanceB,
	}
	newState.Signatures = append(make([][]byte, 0), client.generateSignature(newState))
	client.States.Storage = append(client.States.Storage, newState)
	return &newState
}

func (client *Client) CreateInitialState(balanceA float64, balanceB float64) *State {
	newState := State{
		Step:     1,
		Sender:   client.Name,
		BalanceA: balanceA,
		BalanceB: balanceB,
	}
	newState.Signatures = append(make([][]byte, 0), client.generateSignature(newState))
	client.States.Storage = append(client.States.Storage, newState)
	return &newState
}

func (client *Client) SignLastState() bool {
	last := client.ReadLastOrDefault()
	if len(last.Signatures) < 2 && last.Sender != client.Name {
		if !client.IsClientA(){
			last.Signatures = append(last.Signatures, client.generateSignature(*last))
		} else {
			last.Signatures = append([][]byte{client.generateSignature(*last)}, last.Signatures...)
		}
		return true
	}
	return false
}

func (client *Client) IsClientReadyToSend() bool {
	last := client.ReadLastOrDefault()
	return last.Sender == client.Name
}

func (client *Client) CheckSignatures() bool {
	last := client.ReadLastOrDefault()
	return len(last.Signatures) != 2
}

func (client *Client) ReadStatesToSend() ClientData {
	return ClientData{
		Pending: client.ReadLastOrDefault(),
		Signed:  client.ReadBeforeLast(),
	}
}

func (client *Client) Sign(s *State) {
	s.Signatures = append(s.Signatures, client.generateSignature(*s))
}

func (client *Client) UpdateLastStateSignatures(s *State) {
	state := client.ReadLastOrDefault()

	state.Signatures = s.Signatures
}

// Add un-sign state
func (client *Client) AddPendingState(s *State) {
	client.States.Storage = append(client.States.Storage, *s)
}

func (client *Client) FormatAllStatesToView() string {
	states := client.ReadAllStates()

	var result string
	for _, state := range states {
		result += state.FormatToView() + "\n"
	}
	return result
}

func (client *Client) FormatBalanceToView() string {
	s := client.ReadLastOrDefault()
	b := "Balance "
	if client.IsClientA() {
		return b + strconv.FormatFloat(s.BalanceA, 'f', 6, 64)
	}
	return b + strconv.FormatFloat(s.BalanceB, 'f', 6, 64)
}

func (client *Client) IsClientA() bool {
	if len(client.States.Storage) == 0 {
		return true
	}
	return client.States.Storage[0].Sender == client.Name
}


func (client *Client) generateSignature(state State) []byte {
	step := strconv.FormatUint(state.Step, 10)
	balanceA := strconv.FormatFloat(state.BalanceA, 'f', 6, 64)
	balanceB := strconv.FormatFloat(state.BalanceB, 'f', 6, 64)
	stdout, err := exec.Command(
		config.Cfg.FiftCompiler,
		"-I",
		config.Cfg.FiftLib,
		"-s",
		config.Cfg.PathToScriptSignState,
		SmartContractAddress,
		step,
		balanceA,
		balanceB,
		).Output()
	if err != nil {
		fmt.Println(errors.Wrap(err, "bad: "))
	}

	args := strings.Split(string(stdout), "\n")

	signature := args[1]

	signature = strings.TrimSuffix(signature, "\n")
	signature = strings.Replace(signature, "'", "\"", -1)
	signature = strings.TrimPrefix(signature, "x{")
	signature = strings.TrimSuffix(signature, "}")

	return []byte(signature)
}
