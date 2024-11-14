#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Ús: $0 <nom-BD-actors> <nom-BD-actrius>"
    exit 1
fi

actors_file="$1"
actrius_file="$2"

clear
echo "Llistat d'actors per títol de pel·lícula (ordenats alfabèticament)"
echo "-----------------------------------------------------------------"
tail -n +2 "$actors_file" | sort -t, -k5,5 | awk -F, '{print $2", "$3", "$4", "$5}'
echo
echo "Llistat d'actrius per títol de pel·lícula (ordenats alfabèticament)"
echo "------------------------------------------------------------------"
tail -n +2 "$actrius_file" | sort -t, -k5,5 | awk -F, '{print $2", "$3", "$4", "$5}'

read -n 1 -s -r -p "Prem qualsevol tecla per tornar al menú anterior..."
