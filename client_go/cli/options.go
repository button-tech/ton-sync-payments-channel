package cli

import "github.com/c-bata/go-prompt"

var initOptions = []prompt.Suggest{
	prompt.Suggest{
		Text:        "connect",
		Description: "Connect to other peer",
	},
	prompt.Suggest{
		Text:        "serve",
		Description: "Create connection token",
	},
	prompt.Suggest{
		Text:        "balanceChan",
		Description: "Show balance in sync chan",
	},
	prompt.Suggest{
		Text:        "exit",
		Description: "Exit from app",
	},
	prompt.Suggest{
		Text:        "send",
		Description: "Send some amount",
	},
	prompt.Suggest{
		Text:        "createEmpty",
		Description: "Create empty state",
	},
	prompt.Suggest{
		Text:        "requestEmpty",
		Description: "Request empty state from your partner",
	},
	prompt.Suggest{
		Text:        "sign",
		Description: "Sign last state",
	},
	prompt.Suggest{
		Text:        "showAll",
		Description: "Show all states",
	},
	prompt.Suggest{
		Text:        "showLast",
		Description: "Show last state",
	},
	prompt.Suggest{
		Text:        "deposit",
		Description: "Make deposit",
	},
	prompt.Suggest{
		Text:        "balanceTon",
		Description: "Show balance in workchain",
	},
	prompt.Suggest{
		Text:        "balanceContract",
		Description: "Show balance of contract in workchain",
	},

	prompt.Suggest{
		Text:        "getSeqno",
		Description: "Show seqno of your acc in workchain",
	},

	prompt.Suggest{
		Text:        "withdrawal",
		Description: "Push actual state in to workchain",
	},

	prompt.Suggest{
		Text:        "getAccount",
		Description: "Show user ton account",
	},

	prompt.Suggest{
		Text:        "getPartnerAccount",
		Description: "Show partner ton account",
	},

	prompt.Suggest{
		Text:        "getSmartContractAccount",
		Description: "Show smart contract address",
	},
}
