#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Ús: $0 <nom-BD-actors> <nom-BD-actrius>"
    exit 1
fi

actors_file="$1"
actrius_file="$2"

clear
echo "Llistat d'actors per data del premi (ordenats cronològicament)"
echo "--------------------------------------------------------------"
tail -n +2 "$actors_file" | sort -t, -k2,2n | awk -F, '{print $2", "$3", "$4", "$5}'
echo
echo "Llistat d'actrius per data del premi (ordenats cronològicament)"
echo "--------------------------------------------------------------"
tail -n +2 "$actrius_file" | sort -t, -k2,2n | awk -F, '{print $2", "$3", "$4", "$5}'

read -n 1 -s -r -p "Prem qualsevol tecla per tornar al menú anterior..."
