#!/usr/bin/env bash

read n
# solution 1, using recursive function
declare -A array
if [ $n -gt 5 ]; then
    height=$(bc <<< "2^($n+1) - 1")
    width=$(bc <<< "100*2^($n-5)")
else
    height=63
    width=100
fi

for ((i=0; i < height; i++)); do
    for ((j=0; j < width; j++)); do
        array[$i, $j]=_
    done
done


fractal_tree(){
    # root column
    local root=$1
    # local height
    local h=$2
    local depth=$3

    if [ $depth -eq 0 ]; then
        return 0
    fi
    # half the height
    local h2=$(( h/2 ))
    # 3/4 the height
    local h4=$(( 3*h/4 ))
    # location of 1st and 2nd one (if it's there)
    local one1=$root
    local one2=$one1

    # draw the trunk
    for ((j=h-1; j>h4-1; j--)); do
        array[$j, $one1]=1
    done
    # draw the branches
    for ((; j>h2-1; j--)); do
        (( one1-- ))
        (( one2++ ))
        array[$(( $j )), $one1]=1
        array[$(( $j )), $one2]=1
    done
    # do the same recursivley, making the tip of each branch the new root
    # changing the height to half the toal (h2)
    # and decreasing the depth by 1
    fractal_tree $one2 $h2 $(( depth-1 ))
    fractal_tree $one1 $h2 $(( depth-1 ))
}
#fractal_tree root height depth
fractal_tree $(( width/2 -1 )) $height $n

for ((i=0; i < height; i++)); do
    for ((j=0; j < width; j++)); do
        printf ${array[$i, $j]}
    done
    printf "\n"
done

# # solution 2, using loops
# # the line where the first 1 appears(lines are not zero-indexed)
# begin=$(echo "64/2^$n" | bc)
# for ((i=1; i < begin; i++))
# do
#     printf "_%.0s" {1..100}
#     printf "\n"
# done
# # the current line
# line=$begin
# # the number of ones in line is 64/2^temp; temp = round(log2(line))
# temp=$(printf "%0.0f" $(echo "l($line)/l(2)" | bc -l))
# ones=$(printf "%0.0f" $(echo "64/2^$temp" | bc -l))
# # the number of _ in the left margin
# margin0=$(echo "2^4+2^(5-$n)+1" | bc)
# # the number of _ in the right margin
# margin1=$(( $margin0+1 ))
# # the number 0f _ between differen branches of the same tree/subtree
# spacing0=$(echo "2^(6-$n)-1" | bc)
# # the number 0f _ between differen tree/subtree
# spacing1=$spacing0
# # number of iterations counting from up to down
# m=$(echo "l($line)/l(2)" | bc -l)
# m=${m%%.*}
# # echo margin0:$margin0 margin1:$margin1 line:$line
# # echo spacing0:$spacing0 spacing1:$spacing1 m:$m
# # echo ones:$ones
# # echo
# while [ $line -lt 64 ]
# do
#     printf "_%.0s" $(seq 1 $margin0)
#     if [ $ones -gt 3 ]; then
#         for ((i=0; i<ones; i=i+2))
#         do
#             printf "1"
#             printf "_%.0s" $(seq 1 $spacing0)
#             printf "1"
#             printf "_%.0s" $(seq 1 $spacing1)
#         done
#         printf "_%.0s" $(seq 1 $(( margin1-spacing1 )))
#         printf "\n"
#     elif [ $ones -gt 1 ]; then
#         printf "1"
#         printf "_%.0s" $(seq 1 $spacing0)
#         printf "1"
#         printf "_%.0s" $(seq 1 $margin1)
#         printf "\n"
#     else
#         printf "1"
#         printf "_%.0s" $(seq 1 $margin1)
#         printf "\n"
#     fi

#     # the range where the margins is constant
#     temp=$(printf "%0.0f" $(echo "l($line)/l(2) + 0.5" | bc -l))
#     upper=$(echo "2^$temp" | bc)
#     lower=$(echo "2^$temp-2^($temp-2)+1" | bc)
#     # number of iterations counting from up to down
#     m=$(echo "l($line)/l(2)" | bc -l)
#     m=${m%%.*}


#     (( line++ ))
#     if [ "$line" -le "$upper" -a "$line" -ge "$lower" ]
#     then
#         :
#     else
#         # echo in
#         (( margin0++ ))
#         (( margin1++ ))
#         spacing0=$(( ($spacing0-2+$upper)%$upper ))
#         spacing1=$(( ($spacing1+2)%50 ))

#     fi
#     # the number of ones in line is 64/2^temp; temp = round(log2(line))
#     temp=$(printf "%0.0f" $(echo "l($line)/l(2)" | bc -l))
#     ones=$(printf "%0.0f" $(echo "64/2^$temp" | bc -l))
#     if [ $line -eq 23 -o $line -eq 46 -o $line -eq 47 ]; then
#         ones=$(( $ones*2 ))
#     fi

#     # echo temp:$temp upper:$upper lower:$lower m:$m
#     # echo margin0:$margin0 margin1:$margin1 line:$line
#     # echo spacing0:$spacing0 spacing1:$spacing1 m:$m
#     # echo ones:$ones
#     # echo
# done