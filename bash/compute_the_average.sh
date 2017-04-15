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
printf "%0.03f\n" $(bc -l <<< ""$sum"/"$N"")

