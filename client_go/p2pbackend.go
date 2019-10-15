package backend

import (
	"bufio"
	"context"
	"crypto/rand"
	"fmt"
	"github.com/libp2p/go-libp2p"
	"github.com/libp2p/go-libp2p-core/crypto"
	"github.com/libp2p/go-libp2p-core/network"
	"github.com/libp2p/go-libp2p-core/peer"
	"github.com/libp2p/go-libp2p-core/peerstore"
	"github.com/multiformats/go-multiaddr"
	"github.com/button-tech/ton-sync-payments-channel/client_go/messages"
	"github.com/button-tech/ton-sync-payments-channel/client_go/paychannel"
	"github.com/button-tech/ton-sync-payments-channel/client_go/config"
	"log"
	"os"
	"strconv"
	"time"
	"os/exec"
	"strings"
	"net"
	"github.com/imroc/req"
)

var GlobalBuff *bufio.ReadWriter

var ConnectionDetected = false

func P2PServe(sourcePort int) {
	r := rand.Reader

	prvKey, _, err := crypto.GenerateKeyPairWithReader(crypto.RSA, 2048, r)
	if err != nil {
		panic(err)
	}

	sourceMultiAddr, _ := multiaddr.NewMultiaddr(fmt.Sprintf("/ip4/0.0.0.0/tcp/%d", sourcePort))

	host, err := libp2p.New(
		context.Background(),
		libp2p.ListenAddrs(sourceMultiAddr),
		libp2p.Identity(prvKey),
	)
	if err != nil {
		panic(err)
	}

	host.SetStreamHandler("/chat/1.0.0", handleStream)

	var port string
	for _, la := range host.Network().ListenAddresses() {
		if p, err := la.ValueForProtocol(multiaddr.P_TCP); err == nil {
			port = p
			break
		}
	}

	if port == "" {
		panic("was not able to find actual local port")
	}

	fmt.Printf("To make connection use this address in LAN:"+"\n"+ "/ip4/"+ getLocalIpAddress() +"/tcp/%v/p2p/%s\n\n", port, host.ID().Pretty())

	publicIP, err := getPublicIpAddress()
	if err != nil{
		panic(err)
	}

	fmt.Printf("To make connection use this address in WAN (if you have public IP):"+"\n"+ "/ip4/"+ publicIP +"/tcp/%v/p2p/%s\n", port, host.ID().Pretty())

	fmt.Println()
	fmt.Println("Waiting for incoming connection")
	fmt.Println()
	select {}
}

func P2PConnect(dest string) {
	r := rand.Reader

	prvKey, _, err := crypto.GenerateKeyPairWithReader(crypto.RSA, 2048, r)
	if err != nil {
		panic(err)
	}

	sourceMultiAddr, _ := multiaddr.NewMultiaddr("/ip4/0.0.0.0/tcp/" + strconv.FormatInt(0, 10))

	host, err := libp2p.New(
		context.Background(),
		libp2p.ListenAddrs(sourceMultiAddr),
		libp2p.Identity(prvKey),
	)
	if err != nil {
		panic(err)
	}

	maddr, err := multiaddr.NewMultiaddr(dest)
	if err != nil {
		fmt.Print("Incorrect address")
		os.Exit(1)
	}

	info, err := peer.AddrInfoFromP2pAddr(maddr)
	if err != nil {
		log.Fatalln(err)
	}

	fmt.Println("This node's multiaddresses:")
	for _, la := range host.Addrs() {
		fmt.Printf(" - %v\n", la)
	}
	fmt.Println()

	host.Peerstore().AddAddrs(info.ID, info.Addrs, peerstore.PermanentAddrTTL)

	s, err := host.NewStream(context.Background(), info.ID, "/chat/1.0.0")
	if err != nil {
		panic(err)
	}

	GlobalBuff = bufio.NewReadWriter(bufio.NewReader(s), bufio.NewWriter(s))

	go readData(GlobalBuff)

	paychannel.ClientCreated = paychannel.InitClient("B")
	ConnectionDetected = true

	var data paychannel.ClientData

	data.UserAddress = paychannel.AccountAddress

	signature, err := getUserSignature()
	if err != nil{
		panic(err)
	}

	data.UserSignature = signature

	paychannel.AccountSignature = signature

	time.Sleep(time.Second * 1)
	WriteCommandToChannel(&data, messages.ConnectCMD)

	select {}
}



func WriteCommandToChannel(data *paychannel.ClientData, message string) {
	cmd := messages.CreateCMD(data, message)
	toSend, _ := messages.Marshal(&cmd)
	writeDate(GlobalBuff, toSend)
}

func writeDate(rw *bufio.ReadWriter, payload ...string) {
	var writer string
	for _, v := range payload {
		writer += v
	}

	var err error
	if _, err = rw.WriteString(fmt.Sprintf("%s\n", writer)); err != nil {
		fmt.Println(err)
	}
	if err = rw.Flush(); err != nil {
		fmt.Println(err)
	}
}

func handleStream(s network.Stream) {
	GlobalBuff = bufio.NewReadWriter(bufio.NewReader(s), bufio.NewWriter(s))

	go readData(GlobalBuff)


}

func readData(rw *bufio.ReadWriter) {
	for {
		str, _ := rw.ReadString('\n')
		if str == "" {
			return
		}

		cmd, err := messages.Unmarshal(str)
		if err != nil {
			fmt.Println(err)
			continue
		}
		cmdParser(cmd)
	}
}

func cmdParser(cmd *messages.Command) {
	switch cmd.Header {
	case messages.ConnectCMD:
		PrettyPrint("❗ Got a new stream❗")
	    paychannel.PartnerAddress = cmd.ClientData.UserAddress
	    paychannel.PartnerSignature = cmd.ClientData.UserSignature


	    PrettyPrint("Got partners data:")
	    fmt.Println("Partner signature: " + paychannel.PartnerSignature)
	    fmt.Println("Partner address: " + paychannel.PartnerAddress)

	    c := paychannel.ClientData{}

	    c.UserAddress = paychannel.AccountAddress

	    signature, err  := getUserSignature()
	    if err != nil {
	    	panic(err)
		}

	    c.UserSignature = signature

	    paychannel.AccountSignature = signature

	    WriteCommandToChannel(&c, messages.HandShakeCMD)

	case messages.HandShakeCMD:
	    paychannel.PartnerSignature = cmd.ClientData.UserSignature
	    paychannel.PartnerAddress = cmd.ClientData.UserAddress

	    PrettyPrint("Got partners data:")
		fmt.Println("Partner signature: " + paychannel.PartnerSignature)
		fmt.Println("Partner address: " + paychannel.PartnerAddress)


	case messages.InitialCMD:
		PrettyPrint("❗ Received initial state❗")
		paychannel.ClientCreated.AddPendingState(cmd.ClientData.Pending)

	case messages.SignCMD:
		PrettyPrint("❗ Last state signed successful❗")
		paychannel.ClientCreated.UpdateLastStateSignatures(cmd.ClientData.Pending)

	case messages.RequestExitCMD:
		PrettyPrint("❗ Your partner requested an exit❗")
		clientData := cmd.ClientData.Pending
		paychannel.ClientCreated.UpdateLastStateSignatures(clientData)

	case messages.RequestEmptyStateCMD:
		PrettyPrint("❗ Your partner request empty state❗")

	case messages.ResponseExitCMD:
		PrettyPrint("Your partner approve exit")
		state := paychannel.ClientCreated.ReadLastOrDefault()
		fmt.Println(state.FormatToView())

	case messages.ResponseNewStateCMD:
		paychannel.ClientCreated.UpdateLastStateSignatures(cmd.ClientData.Signed)
		paychannel.ClientCreated.AddPendingState(cmd.ClientData.Pending)
		PrettyPrint( "❗ Received new state❗")

	case messages.InitialCMDB:
		paychannel.ClientCreated.States.Storage[0] = *cmd.ClientData.Pending

	case messages.WithdrawalCMD:
		PrettyPrint("❗ Your partner sent the " + cmd.ClientData.ExitStep + " state to the smart contract❗")
	}
}

func PrettyPrint(s string) {
	fmt.Println()
	fmt.Println(s)
	fmt.Println()
	fmt.Print()
}

func getUserSignature() (string, error){
	stdout, err := exec.Command(
		config.Cfg.FiftCompiler,
		"-I",
		config.Cfg.FiftLib,
		config.Cfg.PathToScriptAccountSignature,
	).Output()
	if err != nil {
		return "", err
	}

	args := strings.Split(string(stdout), "\n")

	signature := args[1]

	signature = strings.TrimSuffix(signature, "\n")
	signature = strings.Replace(signature, "'", "\"", -1)
	signature = strings.TrimPrefix(signature, "x{")
	signature = strings.TrimSuffix(signature, "}")

	return signature, nil
}

func getLocalIpAddress() string {

	addrs, err := net.InterfaceAddrs()

	if err != nil {
		fmt.Println(err)
	}

	var currentIP string

	for _, address := range addrs {
		if ipnet, ok := address.(*net.IPNet); ok && !ipnet.IP.IsLoopback() {
			if ipnet.IP.To4() != nil {
				currentIP = ipnet.IP.String()
			}
		}
	}

	return currentIP
}

func getPublicIpAddress() (string, error) {
	res, err := req.Get("http://ipecho.net/plain")
	if err != nil{
		return "", err
	}

	return res.String(), nil
}
