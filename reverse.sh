#!/bin/bash

declare -a d
d=(`ls -l ${1} | awk '{print $9}'`)



for ((i=$((${#d[@]} - 1)); i>-1; i--)); do
   echo ${d[${i}]}
done
