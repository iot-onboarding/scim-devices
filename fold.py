#!python

import re
from sys import stdin

def fold(line):
    indent=False
    maxlen=68
    if len(line) < maxlen:
        print(line)
        return
    # create a new line that is indented.
    while len(line) > maxlen:
        if not indent:
            newline =  re.sub(r'^(\s+)\S.*',r'\1',line)
            if newline[-1] == '\n':
                newline=newline[:-2]
            newline=newline + '   '
            indent=newline
        else:
            newline=indent
        # we want to give a minimum haircut by words until either the line
        # is under maxlen or the newline plus the next word would be over
        # maxlen
        pt=maxlen-1
        while ((not line[pt] in [' ', '+', '-','(',')', ':']) and pt > 0):
            pt=pt-1
        if pt == 0 or re.match(r'^\s+$',line[0:pt]):
            # we tried playing nice, but there's a key or something
            # that just needs to be folded.  Just split the line.
            pt=maxlen-5
        newline=newline + line[pt:]
        line=line[:pt]
        print(line)
        line=newline
    print(line)

for line in stdin:
    fold(line.rstrip())
