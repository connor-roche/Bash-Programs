#!/bin/bash


letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
counter=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)

for filename in /bin/*;  do
    for ((c=0; c<26; c++)); do
	if [ ${filename:5:1} = ${letters[${c}]} ]; then
	   ((counter[${c}]++))
	fi
    done
done

for ((i=0; i<26; i++)); do
    echo ${letters[${i}]} ${counter[${i}]}
done
