#!/bin/bash

rm -rf pool.addr

/usr/local/bin/ton/liteclient-build/crypto/fift -I /usr/local/bin/ton/lite-client/crypto/fift/lib/ -s pool.fif

printf "\n\nPaste none bounceable address: " && read -r address
printf "\n\nPaste seqno of giver: " && read -r seqno_of_giver

/usr/local/bin/ton/liteclient-build/crypto/fift -I /usr/local/bin/ton/lite-client/crypto/fift/lib/ -s ../testgiver/getMoney.fif $address $seqno_of_giver .5
../cli_commands/sendfile.sh ../bin/get_money-query.boc
sleep 1
../cli_commands/sendfile.sh pool-query.boc 