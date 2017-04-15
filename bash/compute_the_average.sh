!/usr/bin/env bash

read N
sum=0
for i in $(seq 1 "$N")
do
	read I
	((sum += I))
done
echo "$sum"
printf "%0.4f\n" $(bc -l <<< ""$sum"/"$N"")

