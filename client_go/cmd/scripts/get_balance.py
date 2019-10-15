#!/usr/bin/env python3.7
import sys
import subprocess

def get_nano_grams(address):
       stdoutdata = subprocess.getoutput("./getaccount " + address)

       begin = stdoutdata.find("balance:")

       if begin == -1:
           return False

       begin += 80

       f = stdoutdata[begin:]

       return stdoutdata[begin:f.find(")") + begin]

balance = get_nano_grams(sys.argv[1])

if balance == False:
    print("error")
else:
    print(balance)