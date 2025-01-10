#!/bin/bash

n1=$1
n2=$2

Timestamp=$(date)

echo "Script executed at $Timestamp"

sum=$((n1+n2))

echo "sum of $n1 and $n2 is $sum"