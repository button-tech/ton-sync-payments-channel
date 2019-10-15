#!/bin/bash

mkdir -p bin

../../cli_commands/runmethod.sh 0:232618ce5d98e1b4cdf52e7dfc9db8329acec1797622d90d35f7242f6ea364cd seqno
sleep 1

printf "\n\nPaste seqno: " && read -r seqno
printf "\n\nPaste amount: " && read -r amount
printf "\n\nPaste pool address: " && read -r address

/usr/local/bin/ton/liteclient-build/crypto/fift -I /usr/local/bin/ton/lite-client/crypto/fift/lib/ -s msg-body.fif bob bin/msg-body
sleep 1
/usr/local/bin/ton/liteclient-build/crypto/fift -I /usr/local/bin/ton/lite-client/crypto/fift/lib/ -s send.fif bob $address $seqno $amount bin/msg-body bin/wallet-query
sleep 1
../../cli_commands/sendfile.sh bin/wallet-query.boc