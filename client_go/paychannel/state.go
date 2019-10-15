package paychannel

import (
	"strconv"
)

type State struct {
	Signatures [][]byte
	BalanceA   float64
	BalanceB   float64
	Step       uint64
	Sender     string
}

func IsFull(state *State) bool {
	return state.Signatures != nil && len(state.Signatures) == 2
}

func (s *State) FormatToView() string {
	var result string
	result += "Sender " + s.Sender + "\n"
	result += "A [" + strconv.FormatFloat(s.BalanceA, 'f', 6, 64) + " " +
		strconv.FormatFloat(s.BalanceB, 'f', 6, 64) + "] B" + "\n"
	result += "Step " + strconv.FormatUint(s.Step, 10) + "\n"
	result += "Signs "
	if len(s.Signatures) == 2 {
		result += "A [" + string(s.Signatures[0][0]) + " " + string(s.Signatures[1][0]) + "] B" + "\n"
	} else if len(s.Signatures) >= 1 {
		for _, v := range s.Signatures {
			result += string(v) + " "
		}
		result += "\n"
	}
	return result
}
