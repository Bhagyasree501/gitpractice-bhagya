#!/bin/bash

FRUITS=("plum" "apple" "orange")
# In any array, index value starts with 0
#In above array, size of the array is 3
echo "The first fruit is ${FRUITS[0]}"
echo "The second fruit is ${FRUITS[1]}"
echo "All fruits in this array are ${FRUITS[@]}"
