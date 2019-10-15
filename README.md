# Synchronous two-party payment channel

We assume that on each machine you have already setted up your private key in key/ folder.

We use this private keys to sign messages offchain and onchain

You can use any private key, but you firstly need a wallet that have grams if you want to deploy contract using it

## Running 

What do you need to run it:

You need to create catalog with `wallet.addr `and `wallet.pk` files (account with Grams).

1. Deploy Smart contract on TON

```
    bash deploy.sh
```

For server you need to run with port like:

1) First terminal window:
```
docker run -it -p port:port -v path_to_catalog_with_files:/app/data buttonwallet/synchannel
```

2) Second terminal window:
```
docker run -it -v path_to_another_catalog_with_files:/app/data buttonwallet/synchannel
```
3) Enter smart contract address:

```
 0:E6DE901D76CDC66C2269201280658DA017D04A75619D8BE5E63E104FA5F6F477
```

4) Setup peer to peer connection

Person who deployed Smart Contract needs to serve connection with command

Terminal 1:
```
    serve
```

Than you need to chose a port where your connection will be served:

```
Please, enter a source port or enter "exit": 3000
To make connection use this address in LAN:
/ip4/172.17.0.3/tcp/3000/p2p/QmeZ1Ykwj57BGqeSjU66pvh5iDfSYjW2EugqaFkZ5UENYw

To make connection use this address in WAN (if you have public IP):
/ip4/178.140.100.51/tcp/3000/p2p/QmeZ1Ykwj57BGqeSjU66pvh5iDfSYjW2EugqaFkZ5UENYw

Waiting for incoming connection
```

Later you need to copy this link and sent it to your partner (person 2)

LAN for local 

or 

WAN for public

```
/ip4/172.17.0.3/tcp/3000/p2p/QmeZ1Ykwj57BGqeSjU66pvh5iDfSYjW2EugqaFkZ5UENYw
```

Partner needs to run 

```
    connect
```

And enter connection string there

```
/ip4/172.17.0.3/tcp/3000/p2p/QmeZ1Ykwj57BGqeSjU66pvh5iDfSYjW2EugqaFkZ5UENYw
```

If connection is successfull, you will automatically send partner your address and your signature that prove that it is your address

You will got something like this:

```
Partner signature: 78FB74C5FDD013648BF060663AF55DE25566D310021D5F448403168890F85C80D6339A1EC63C6917823B9CAA3F6EB95819334C0F7AB70FD34F54A733FCF2010A
Partner address: kQDI-VEsKDl-v8HFpyl51HrNmwWX-37ZXLNu9PvsHglupowG
```
5) We have a smart contract, let's deposit money to it from each terminal:

Terminal 1:
```
    deposit
```

You will see your wallet balance in GRAMS

```
Your account balance now: 38.433277 Gram

Enter amount to put on contract or "exit"
```

Next, you need to enter GRAMs amount that you will send to the contract


Your partner need to repeat the same operation

After notification
```
❗ Received initial state❗
```

The last of 2 people who made the deposit needs to sign initial state with command 

```
 sign
```

And after that you can run command **showAll** will see something like this

```
Sender A
A [3.000000 4.000000] B
Step 1
Signs A [F 3] B
```


All commands:
```
serve			  create connection token
connect			  connect to other peer
deposit			  make deposit
send			  send some amount
sign			  sign last state
balanceContract          show balance of contract in workchain
balanceChan	          show balance in sync chan
balanceTon               show balance in workchain
getAccount               show user ton account
getPartnerAccount        show partner ton account
getSmartContractAccount  show smart contract address
getSeqno                 show seqno of your acc in workchain
createEmpty 		  create empty state
requestEmpty		  request empty state from your partner
showAll			  show all states
showLast		  show last state
withdraw                 push actual state in to workchain
exit			  exit from app
```
6) Right now you can send an offchain transaction from Terminal 1 (The first state num can be sent only from it)

Terminal 2:
```
send 1 or send .1 or send 0.1
```

You will get inforamation at Terminal 1:
```
❗ Received new state❗
```


and than you need to approve and sign new state that Terminal 2 sent to you:
```
showLast
sign
showAll
```

```
Sender A
A [3.000000 4.000000] B
Step 1
Signs A [F 3] B

Sender B
A [3.200000 3.800000] B
Step 2
Signs A [7 9] B

```

So, at Terminal 1 you will see a confirmation, now it is Terminal 2 turn to send transaction

```
❗ Last state signed successful❗
```

If you want sent tx to your partner but now is not your turn you can use command `requestEmpty`

Than your partner will see notification:
```
❗ Your partner request empty state❗
```
If you agree with that you can create empty state by command `createEmpty`

and your partner should sign it

7) Let's do a withdraw:

Terminal 1:
```
withdrawal  
```

Than you need to enter step number that you wanna send to the contract:
```
Enter step number: 2
Signature A: 73A6FADA9F3FA985BB000404AD1FAC434FE12AE310EC2390522AA9B42843C3301FA52026BF7BFEA460E2FC7413D6CD67DDB76BB455DCD634A1C9437843B9AA0A
Signature B: 97A45EDC329F58B6B50C9D78CFEE2AC2D9C6A160D806E6D8C0F5CC5E36537FE73156DF834102CD84953A3AE133D3E47897652D7F0AFB24F50A4FE5136801E003
Balance A: 3.200000
Balance B: 3.800000
Account signature: 78FB74C5FDD013648BF060663AF55DE25566D310021D5F448403168890F85C80D6339A1EC63C6917823B9CAA3F6EB95819334C0F7AB70FD34F54A733FCF2010A
Partner signature: 6C6A86A1A5D1CCA53FD60620B0871AA0F8CCEA00655F0B1AEEF4D2F5F981C4AE6937988D42C423DFF43F81C6D0F49ABB9966F0984D4FE4362338479457B78609
Step: 2
Contract seqno: 3
Are you sure[y/n]:y
```

Than if transaction completed, your partner will see notification:
```
❗ Your partner sent the state to the smart contract❗
```

And than he can do withdrawal it too

After that two person will see all information about result balances:

```
Success withdrawal!
Your balance in workchain now: 37.014310
Partner balance in workchain now: 52.548630
Smart contract balance in workchain now: 0.932511
```


With CLI you can withdraw peacfully, however, it could be another option:

If there is a confilct on smart contract, you can withdraw it by applying the latest state

You can see all the states by:

```
showAll 
```

## Details of implementation

TON WP was used is theortical base.

We have:

User 1 (A),
User 2 (B)

Smart contract (SC)


### 1 Beofore deposit (Onchain + Offchain):

We assume that A and B will have a secure p2p connection between each other. We use our own implmentation on Goland.

A and B needs to exchange the public keys, ton wallet addresses and signatures that prooves, that it is a correct address.

Also someone needs to deploy and pay for gas on SC, so we assume that A and B already reached agreement about that.


### 2 Deposit (Onchain):

A and B send a query from TON Wallet to SC. They need to send GRAMS and initial details of state.

**Initial details of state:**

| Variables         |                    Description                   |
|-------------------|--------------------------------------------------|
| Public Key A      | Needs to check signatures and owners of contract |
| Public Key B      | Needs to check signatures and owners of contract |
| Amount A          | Needs to check that total sum A + B during exit will be correct |
| Amount B          | Needs to check that total sum A + B during exit will be correct |

*Amount A and B are calculated based on amount that A and B will send to SC*


### 3 Sending GRAMs to each other (Offchain):

It is Sync Channel, so onlu one of A and B can send GRAMs to each other.

But we implemented a possibility to request your turn. If you will request it, B needs just to sign to old state with new state_num +=1

We use our client to send GRAMs as well

### 4 Withdraw (Onchain)

Case with the same states:


Each of A and B needs to send:

| Variables         |                    Description                   |
|-------------------|--------------------------------------------------|
| Amount A          | Amount of GRAMs that will be sent to A |
| Amount B          |  Amount of GRAMs that will be sent to B |
| State_num         |  Current amount of all transactions between A and B offchain |
| pool_address         |  Address of current SC to make signature unique per contract|
| slice_ref with signature A         |   Check that A agreed with current state|
| slice_ref with signature B         |   Check that A agreed with current state|

Case with confilct:

If A applied to withdraw and then B applied with confilct.

A have option to send another state that have state_num > than current

If it will be provided, withdraw will be executed with this state

## Authors

Nick Kozlov - CTO and Co-founder of BUTTON Wallet (@enormousrage, nk@buttonwallet.com)

Kirill Kuznecov - Co-founder of BUTTON Wallet (@krboktv, kk@buttonwallet.com)

Alexey Prazdnikov - Fullstack developer at BUTTON Wallet (@noprazd, ap@buttonwallet.com)

Max Spiridonov - Backend developer at BUTTON Wallet (@maxSpt, ms@buttonwallet.com)

Roman Semenov -  One of founders of Copperbits community, co-author of Tornado.cash Ethereum mixer (@poma, semenov.roma@gmail.com)

Igor Gulamov Blockchain Researcher and Entrepreneur (@igor_gulamov, igor.gulamov@gmail.com)

