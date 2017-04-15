!/usr/bin/env bash

read N
sum=0
i=1
while [ "$i" -le "$N" ]
do
	read J
	((sum += J))
	((i += 1))
done
echo "$sum"
echo $(bc -l <<< "scale=3;"$sum"/"$N"")

