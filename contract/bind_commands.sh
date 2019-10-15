[ -d "/usr/local/bin/ton" ] || mkdir "/usr/local/bin/ton" 

cp -R ./lite-client /usr/local/bin/ton
cp -R ./liteclient-build /usr/local/bin/ton
cp -R ./cli_commands /usr/local/bin/ton

echo "alias fift=\"/usr/local/bin/ton/liteclient-build/crypto/fift -I /usr/local/bin/ton/lite-client/crypto/fift/lib/\"" >> ~/.zshrc

echo "alias func=\"/usr/local/bin/ton/liteclient-build/crypto/func -o outputFileWithFiftAsm.fif /usr/local/bin/ton/lite-client/crypto/smartcont/stdlib.fc\"" >> ~/.zshrc

echo "alias getaccount=\"$(pwd)/cli_commands/getaccount.sh\"" >> ~/.zshrc

echo "alias last=\"$(pwd)/cli_commands/last.sh\"" >> ~/.zshrc

echo "alias ton=\"$(pwd)/cli_commands/run_cli.sh\"" >> ~/.zshrc

echo "alias runmethod=\"$(pwd)/cli_commands/runmethod.sh\"" >> ~/.zshrc

echo "alias sendfile=\"$(pwd)/cli_commands/sendfile.sh\"" >> ~/.zshrc