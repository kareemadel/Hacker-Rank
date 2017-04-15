#!/usr/bin/env bash

read X
read Y
if [ "$X" -lt -100 -o "$X" -gt 100 -o "$Y" -lt -100 -o "$Y" -gt 100 -o "$Y" -eq 0 ]; then
	exit
fi
echo -e $((X+Y)) \n $((X-Y)) \n $((X*Y)) \n $((X/Y))
