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

function menu_cataleg(){
while true; do
    echo "------------------------------------------"
    echo "2 - Cerca al catàleg."
    echo "------------------------------------------"
    echo "1 Qui va guanyar durant els anys ...?"
    echo "2 Qui va guanyar amb la pel·lícula ...?"
    echo "3 Pel·lícules guanyades per ...?"
    echo "0 Tornar al menú anterior"
    echo "------------------------------------------"
    read -p "Seleccioneu una opció: " opcio

    case $opcio in
        1)
            read -p "Introduïu l'any d'inici: " any1
            read -p "Introduïu l'any final: " any2
            if [[ $any1 -le $any2 ]]; then
                bash ./tasca2-1.sh "$1" "$2" "$any1" "$any2"
            else
                echo "L'any d'inici ha de ser menor o igual al final."
            fi
            ;;
        2)
            read -p "Introduïu una cadena de caràcters pel títol de la pel·lícula: " titol
            bash ./tasca2-2.sh "$1" "$2" "$titol"
            ;;
        3)
            read -p "Introduïu una cadena de caràcters pel nom de la persona: " nom
            bash ./tasca2-3.sh "$1" "$2" "$nom"
            ;;
        0)
            echo "Tornant al menú anterior..."
            exit 0
            ;;
        *)
            echo "Opció no vàlida."
            ;;
    esac
done


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
            2)
                menu_cataleg "$1" "$2"
                ;;
	    3|4)
		enDesenvolupament
		;;
            0)
                clear
		echo "Gracies per visitar 'Amor pel sete Art'"
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
