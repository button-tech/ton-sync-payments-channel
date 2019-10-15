#!/usr/bin/env python3.7
import sys
import subprocess

def get_contract_status(address):
       stdoutdata = subprocess.getoutput("./contract_status " + address)

       begin = stdoutdata.find("result: ")

       if begin == -1:
           return False

       s = stdoutdata[begin:].find("[")

       status = stdoutdata[begin+s:]

       status = status.replace("[", "")
       status = status.replace("]", "")
       status = status.replace(">", "")
       status = status.replace("\n", "")
       status = status.replace(" ", "")

       return status



status = get_contract_status(sys.argv[1])

if status == False:
    print("error")
else:
    print(status)