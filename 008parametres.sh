#!/bin/bash

#es mostra l'script executat
echo "Nom del script ${0}"

#mostram el PATH (RUTA) i el filename del script
echo "el PATH: $(dirname ${0}) el fitxer seria $(basename ${0})"

#per determinar el número de paràmetres
NUMERO_DE_PARAMETRES=${#}

if [[ ${NUMERO_DE_PARAMETRES} -eq 0 ]]
then
    echo "USAGE: ${0} USER_NAME [USER_NAME] ..."
    exit 1
fi

#${*} mostra el conjunt de paràmetres en una sola paraula "${1} ${2}....${n}"
echo "${*}"
echo
#${@} mostra el conjunt de paràmetres en paraules diferents "${1}" "${2}"...."${n}"
echo "${@}"

#estructura de control FOR per interar els paràmetres
for USER_NAME in "${@}"
do
    PASSWORD=$(date +%s%N | sha256sum | head -c10)
    echo "${USER_NAME}:${PASSWORD}" 
done