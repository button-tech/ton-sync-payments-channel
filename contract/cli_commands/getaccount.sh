#!/bin/bash

echo "last" > /usr/local/bin/ton/in.fifo
echo "getaccount $1" > /usr/local/bin/ton/in.fifo
