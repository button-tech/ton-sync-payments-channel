package messages

import (
	"encoding/json"
	"github.com/button-tech/ton-sync-payments-channel/client_go/paychannel"
)

const (
	ConnectCMD 			 = "ConnectCMD"
	InitialCMD           = "InitialCMD"
	InitialCMDB          = "InitialCMDB"
	RequestEmptyStateCMD = "RequestEmptyStateCMD"
	RequestExitCMD       = "RequestExitCMD"
	SignCMD              = "SignCMD"
	ResponseNewStateCMD  = "ResponseNewStateCMD"
	ResponseExitCMD      = "ResponseExitCMD"
	HandShakeCMD = "HandShakeCMD"
	WithdrawalCMD = "WithdrawalCMD"
)

type Command struct {
	PartnerAddress string
	PartnerSignature string
	Header     string
	ClientData *paychannel.ClientData
}

func Unmarshal(in string) (*Command, error) {
	var result Command

	if err := json.Unmarshal([]byte(in), &result); err != nil {
		return nil, err
	}
	return &result, nil
}

func Marshal(cmd *Command) (string, error) {
	result, err := json.Marshal(cmd)
	if err != nil {
		return "", err
	}
	return string(result), nil
}

func CreateCMD(clientData *paychannel.ClientData, header string) Command {
	return Command{
		Header:     header,
		ClientData: clientData,
	}
}
