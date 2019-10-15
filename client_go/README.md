Folder ```cmd``` contains ```config.yaml``` which you need to change for yourself.

```
Run:
> sh compile.sh
> cd bob|alice
> ./main config_alice.yaml|config_bob.yaml

```

```
Commands:
serve			create connection token
connect			connect to other pee
deposit			make deposit
send			send some amount
sign			sign last state
balance			show balance
createEmpty 		create empty state
requestEmpty		request empty state from your partner
showAll			show all states
showLast		show last state
exitFromDeal		request to exit from deal
approveExit		approve to exit from deal
exit			exit from app
```

Run in docker:

1. Create ton wallet
2. Rename your .addr and .pk as `wallet.addr`,`wallet.pk`

```
# docker build -t image .
# docker run -ti -p port:port -v catalog_with_keys:/app/data image
```