#!/bin/bash
read -p "Introdueix X: " X

if [[ ${X} -eq 5 ]]
then
    echo "has introduit un 5"
else
    echo "no has introduit un 5"
fi