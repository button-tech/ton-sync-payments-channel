#!/bin/bash

mkdir -p bin

../../cli_commands/runmethod.sh 0:c8f9512c28397ebfc1c5a72979d47acd9b0597fb7ed95cb36ef4fbec1e096ea6 seqno
sleep 1

printf "\n\nPaste seqno: " && read -r seqno
printf "\n\nPaste amount: " && read -r amount
printf "\n\nPaste pool address: " && read -r address

/usr/local/bin/ton/liteclient-build/crypto/fift -I /usr/local/bin/ton/lite-client/crypto/fift/lib/ -s msg-body.fif alice bin/msg-body
sleep 1
/usr/local/bin/ton/liteclient-build/crypto/fift -I /usr/local/bin/ton/lite-client/crypto/fift/lib/ -s send.fif alice $address $seqno $amount bin/msg-body bin/wallet-query
sleep 1
../../cli_commands/sendfile.sh bin/wallet-query.boc