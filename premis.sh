#!/bin/bash

function mostrar_menu() {
    clear
    echo "---------------------------------------------------------"
    echo "Catàleg de guanyadors i guanyadores d’Oscars"
    echo "---------------------------------------------------------"
    echo "1. Llistats del catàleg."
    echo "2. Cerca al catàleg."
    echo "3. Com ets d’Expert?"
    echo "4. Gestió del catàleg."
    echo "0. Sortir."
    echo "---------------------------------------------------------"
    echo -n "Selecciona una opció: "
}

function enDesenvolupament() {
    clear
    echo "En desenvolupament"
    read -n 1 -s -r -p "Prem qualsevol tecla per continuar..."
    clear
}

function opcioNoValida() {
    clear
    echo "Error: Opció no vàlida"
    sleep 2
    clear
}

function menu_llistat() {
    while true; do
        clear
        echo "--------------------------------------------------"
        echo "1 - Llistats del catàleg."
        echo "--------------------------------------------------"
        echo "1 Llistat d’actors i actrius per data del premi."
        echo "2 Llistat alfabètic de pel·lícules."
        echo "3 Llistat per edat d’actors i actrius."
        echo "0 Tornar al menú anterior."
        echo "--------------------------------------------------"
        echo -n "Selecciona una opció: "
        
        read subopcio
        case $subopcio in
            1)
                bash ./tasca1_1.sh "$1" "$2"
                ;;
            2)
                bash ./tasca1_2.sh "$1" "$2"
                ;;
            3)
                bash ./tasca1_3.sh "$1" "$2"
                ;;
            0)
                clear
                return
                ;;
            *)
                opcioNoValida
                ;;
        esac
    done
}

function main() {
    while true; do
        mostrar_menu
        read opcio

        case $opcio in
            1)
                menu_llistat "$1" "$2"
                ;;
            2|3|4)
                enDesenvolupament
                ;;
            0)
                clear
                echo "Gràcies per visitar 'Amor pel Setè Art'"
                exit 0
                ;;
            *)
                opcioNoValida
                ;;
        esac
    done
}

if [[ $# -ne 2 ]]; then
    echo "Ús: $0 <nom-BD-actors> <nom-BD-actrius>"
    exit 1
fi

main "$1" "$2"
