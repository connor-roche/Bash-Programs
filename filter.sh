#!/bin/bash
average () {
    declare -a size
    size=(`ls -l ${1} | awk '{print $5}'`)
    avg=0
    
    for ((i=0; i<${#size[@]}; i++)); do
	avg=$(($avg + ${size[i]}))
    done

    avg=$(($avg / ${#size[@]}))

    echo "The average is: ${avg}"
}

filter () {
    declare -a file
    declare -a size
    size=(`ls -l ${1} | awk '{print $5}'`)
    file=(`ls -l ${1} | awk '{print $9}'`)

    for((i=0;i<${#file[@]};i++)); do
	file[$i]=$(basename ${file[$i]})
    done

    for((i=0;i<${#size[@]};i++)); do
	if [ ${size[$i]} -gt $avg ]; then
	    echo "${file[$i]}(${size[$i]})"
	fi
    done
}
	    
###
#  main
###

dir=$1
average $dir
filter $dir

