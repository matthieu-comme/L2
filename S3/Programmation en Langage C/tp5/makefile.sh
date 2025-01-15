#!/bin/bash
rm -f *.o
for file in *.c
do 
	gcc -c $file
done
gcc `ls *.o` -o prog
