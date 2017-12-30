#!/bin/bash

declare -a numbers;
numbers=(${@})

for ((i=1;i<${#numbers[@]};i++)); do
    temp=${numbers[$i]}
    h=$(($i-1))
    while [ $temp -lt ${numbers[$h]} ]; do
	numbers[$(($h+1))]=${numbers[$h]}
	((h--))
	if [ $h -lt 0 ]; then
	    break
	fi
    done
    numbers[$(($h+1))]=$temp
done


echo ${numbers[@]}
