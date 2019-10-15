## Navigation
- [Aliases](#aliases)
- [TON CLI](#ton-cli)
- [RUN FIFT](#run-fift)
- [RUN FUNC](#run-func)
- [Deploy pool contract](#deploy-pool-contract)
- [Make deposit](#make-deposit)
- [Get money back](#get-money-back)
- [Send exit state](#send-exit-state)

## Aliases
Dependencies: 
Works only in [zsh](https://github.com/robbyrussell/oh-my-zsh)
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

## Deploy pool contract
Go to `pool` folder

Place  (`alice/alice.pk`, `alice/alice.addr`) and (`bob/bob.pk`, `bob/bob.addr`) with non-zero balances

For [./bind_commands.sh](#aliases) script
1.Get seqno of giver
```bash
runmethod 0:e4b867748f26658f1fb18e9e0e755edbe2c7650a2bafadbd216f94c3142385e2 seqno
```
2.Run `./deploy.sh`  
  1.Enter non-bouncable address  
  2.Seqno of giver
  3.Done   

Else you need to:  
1.Run `fift pool.fif`  
2.Get money on future contract address     
3.Send `.boc` to the network     
 
## Make deposit

Go to alice directory (new the same action with bob directory)

For [./bind_commands.sh](#aliases) script
```bash
./send.sh
```
and follow steps  

Else you need to:  
1.Get seqno of your wallet contract  

2.Create `bin` folder  

3.Run `fift -s msg-body.fif [alice|bob] bin/msg-body`  

4.Run `fift -s send.fif [alice|bob] [pool address] [alice seqno] [deposit amount] bin/msg-body bin/wallet-query`  

5.Send `bin/wallet-query.boc` to the network  

## Get money back

Before last participant make a deposit you can get your money back following next steps (example for alice):

1.Run `fift -s get_money_back.fif alice/alice [pool seqno] [address for withdrawal] [pool address]`

2.Send `.boc` to the network

## Send exit state
1.Go to `pool/utils` folder

2.Run `fift -s sign_state.fif ../bob/bob [pool address] [state num] [alice withdrawal amount] [bob withdrawal amount]` to get bob's signature

2.Run `fift -s sign_state.fif ../alice/alice [pool address] [state num] [alice withdrawal amount] [bob withdrawal amount]` to get alice's signature

3.Paste signatures to `pool/signatures.fif` file. `signature_one` is alice's signature, `signature_two` is bob's signature

4.Run `fift -s get_address.fif ../alice/alice` to get the signature of alice's address

5.Run `fift -s get_address.fif ../bob/bob` to get the signature of bob's address

6.Paste signatures to `pool/signatures.fif` file.

7.Run `fift -s send_second_state.fif alice/alice [pool seqno] [state num] [alice's amount] [bob's amount] [alice's address] [bob's address] signatures [pool address]`

8.Send `.boc` to the network
