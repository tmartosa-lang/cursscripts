#!/bin/bash

#aquest script ens mostra com
#realitzar les principals operacions aritmétiques

read -p "introdueix el valor de X: " X
read -p "introdueix el valor de Y: " Y

echo "Has introduït ${X} i ${Y}"
SUMA=$((X+Y))
echo "${X}+${Y}=${SUMA}"
RESTA=$((X-Y))
echo "${X}-${Y}=${RESTA}"
PRODUCTE=$((X*Y))
echo "${X}*${Y}=${PRODUCTE}"
DIVISIO=$(echo "scale=2; ${X}/${Y}" | bc)
echo  "${X}/${Y}=${DIVISIO}"
