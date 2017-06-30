#!/usr/bin/env bash

#read N
#sum=0
#i=1
#while [ "$i" -le "$N" ]
#do
#	read J
#	((sum += J))
#	((i += 1))
#done
#echo "$sum"
#printf "%0.03f\n" $(bc -l <<< ""$sum"/"$N"")

read n
sum=0
for ((i=0; i < $n; i++))
do
    read x
    sum=$(( $sum+$x ))
done
printf "%0.4f\n" $(echo "$sum/$n" | bc -l)
