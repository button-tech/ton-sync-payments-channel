## Navigation
- [Aliases](#aliases)
- [TON CLI](#ton-cli)
- [RUN FIFT](#run-fift)
- [RUN FUNC](#run-func)

## Aliases
Dependencies: 
Works only in [Zsh](https://github.com/robbyrussell/oh-my-zsh)
```bash
./bind_commands.sh
source ~/.zshrc
```

## TON CLI
### Run TON Cli via Zsh alias
```
ton
```
Or
```bash
../cli_commands/run_cli.sh

# OR

mkfifo in.fifo out.fifo

./liteclient-build/lite-client/lite-client -C ./liteclient-build/ton-lite-client-test1.config.json > out.fifo < in.fifo &

cat out.fifo &
```

### Allowed methods example  
```
getaccount kQBdrwcUHFKz6pm6ou5NdB2fChwYyfbKKuQjkQbinZeO0BrI

runmethod kQD-pzh-6pVcJW7KpIGiR-QoaD-coj1wxBPvxutHedAXKFBf seqno

last

sendfile bin/wallet-query.boc

func new-wallet.fc

fift
```

## RUN FIFT

```bash
./liteclient-build/crypto/fift -I ./lite-client/crypto/fift/lib/ some.fif

# if args in some.fif

./liteclient-build/crypto/fift -I ./lite-client/crypto/fift/lib/ -s some.fif arg1 arg2 ...
```

## RUN FUNC

```bash
./liteclient-build/crypto/func -o outputFileWithFiftAsm.fc -W run.boc ./lite-client/crypto/smartcont/stdlib.fc some.fc
```