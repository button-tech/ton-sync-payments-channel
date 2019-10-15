package main

import (
	"github.com/button-tech/ton-sync-payments-channel/client_go/cli"
	"github.com/button-tech/ton-sync-payments-channel/client_go/config"
	"log"
	"os"
)

func main() {
	if len(os.Args) == 1 {
		log.Fatal("Put path to config file")
	}

	var err error
	config.Cfg, err = config.Get(os.Args[1])
	if err != nil {
		log.Fatal(err)
	}
	cli.New()
}
