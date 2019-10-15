#!/bin/bash

echo "last" > /usr/local/bin/ton/in.fifo
echo "runmethod $1 $2" > /usr/local/bin/ton/in.fifo