#!/bin/bash
echo "int f$((1 + RANDOM % 99999))() method_id {
  return $((1 + RANDOM % 99999));
}" > random.fc

/usr/local/bin/ton/liteclient-build/crypto/func -o outputFileWithFiftAsm.fc -W run.boc /usr/local/bin/ton/lite-client/crypto/smartcont/stdlib.fc random.fc

method_id=$(cat outputFileWithFiftAsm.fc | head -n4 | tail -n1 | awk '{print $1}')
asm=$(cat outputFileWithFiftAsm.fc | head -n6 | tail -n1)

cat $(pwd)/new-testgiver.fif | sed "26s/.*/|DUP $method_id INT EQUAL IFJMP:<{|$asm|}>|/" | tr '|' '\n' > $(pwd)/new-testgiverEdited.fif

new_giver=$(/usr/local/bin/ton/liteclient-build/crypto/fift -I /usr/local/bin/ton/lite-client/crypto/fift/lib/ -s new-testgiverEdited.fif 0)
echo "$new_giver" > logs.txt

nonbouncable=$(echo "$new_giver" | head -n31 | tail -n1 | awk '{print $NF}')
bouncable=$(echo "$new_giver" | head -n32 | tail -n1 | awk '{print $NF}')
hex=$(echo "$new_giver" | head -n23 | tail -n1 | awk '{print $NF}') 

echo -e "\\x1b[1;31mCompiled giver contract\x1b[0m"
echo -e "\\x1b[1;33mHex address:\x1b[0m $hex"
echo -e "\\x1b[1;33mBouncable address:\x1b[0m $bouncable"
echo -e "\\x1b[1;33mNonbouncable address:\x1b[0m $nonbouncable"

printf '\n\nPaste old giver address: ' && read -r old_giver_address

../cli_commands/getaccount.sh $old_giver_address
sleep 2

printf '\n\nPaste seqno of old giver: ' && read -r seqno_of_old_giver
printf '\n\nPaste amount: ' && read -r amount

sed -i.bak "12s/.*/Basechain ${old_giver_address//:/x}/" $(pwd)/getMoney.fif

/usr/local/bin/ton/liteclient-build/crypto/fift -I /usr/local/bin/ton/lite-client/crypto/fift/lib/ -s getMoney.fif $nonbouncable $seqno_of_old_giver $amount
../cli_commands/sendfile.sh ../bin/get_money-query.boc
../cli_commands/sendfile.sh ../bin/new-testgiver-query.boc

sleep 2

rm -rf random.fc
rm -rf new-testgiverEdited.fif
rm -rf getMoney.fif.bak
rm -rf outputFileWithFiftAsm.fc
printf "Done!"

