#!/bin/bash

./liteclient-build/crypto/fift -I ./lite-client/crypto/fift/lib/ -s withdraw.fif $1 $2 $3 $4 $5 $6 $7
./sendfile withdraw-query.boc
rm withdraw-query.boc
