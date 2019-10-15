#!/bin/bash

./liteclient-build/crypto/fift -I ./lite-client/crypto/fift/lib/ msg-body.fif
./liteclient-build/crypto/fift -I ./lite-client/crypto/fift/lib/ -s deposit.fif $1 $2 $3 msg-body
./sendfile wallet-query.boc
rm wallet-query.boc