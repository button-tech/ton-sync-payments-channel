#!/usr/bin/env python3.7
import sys
import subprocess

def get_seqno(address):
       stdoutdata = subprocess.getoutput("./seqno " + address)

       begin = stdoutdata.find("result: ")

       if begin == -1:
           return False

       s = stdoutdata[begin:].find("[")

       seqno = stdoutdata[begin+s:]

       seqno = seqno.replace("[", "")
       seqno = seqno.replace("]", "")
       seqno = seqno.replace(">", "")
       seqno = seqno.replace("\n", "")
       seqno = seqno.replace(" ", "")

       return seqno



seqno = get_seqno(sys.argv[1])

if seqno == False:
    print("error")
else:
    print(seqno)