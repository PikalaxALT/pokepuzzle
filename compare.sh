#!/bin/sh
# Compares baserom.gbc and pokepuzzle.gbc

# create baserom.txt if necessary
if [ ! -f baserom.txt ]; then
	hexdump -C baserom.gbc > baserom.txt
fi

hexdump -C pokepuzzle.gbc > pokepuzzle.txt

diff -u baserom.txt pokepuzzle.txt | less
