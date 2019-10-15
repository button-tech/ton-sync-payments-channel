[ -d "bin" ] || mkdir "bin"      # if fifo not found, create

rm -rf "/usr/local/bin/ton/in.fifo"
rm -rf "/usr/local/bin/ton/out.fifo"

std_in="/usr/local/bin/ton/in.fifo"
std_out="/usr/local/bin/ton/out.fifo"

[ -p "$std_in" ] || mkfifo "$std_in"      # if fifo not found, create
[ -p "$std_out" ] || mkfifo "$std_out"    # if fifo not found, create

# delete all previos processes with cli
pkill -f "lite-client"
pkill -f "run_cli.sh"
pkill -f "cat *out.fifo"

# run cli
/usr/local/bin/ton/liteclient-build/lite-client/lite-client -C /usr/local/bin/ton/liteclient-build/ton-lite-client-test1.config.json > $std_out < $std_in & 

cat $std_out &

echo "TON CLI was ran"