#!/bin/bash
function usage(){
    echo "Usage ${0} USER_NAME [COMMENTS]"
    echo
    echo "has de ser root"
    echo "COMMENTS inclourà el nom complet de l'usuari"
    exit 1 #indica que hi ha hagut una errada
}

#Script per crear un usuari 

#primer comprovam si som l'usuari root
if [[ ${UID} -ne 0 ]]
then
    usage
fi

#hem de comprovar que tenim al manco un paràmetre
if [[ ${#} -eq 0 ]]
then
    usage
fi

USER_NAME=${1}
#desplaçamparàmetres a l'esquerra
shift
COMMENTS=${*}

#generam password aleatori
PASSWORD=$(date +%s%N | sha256sum | head -c 8)


#crearíem l'usuari
useradd -m -c "${COMMENTS}" ${USER_NAME} &> /dev/null
#control de la darrera comanda
if [[ ${?} -ne 0 ]]
then
    echo "Errada creant l'usuari"
    exit 1
fi

#canvi de password
echo "${USER_NAME}:${PASSWORD}" | chpasswd
#comprovam si el canvi de password ha anat bé.
if [[ ${?} -ne 0 ]]
then
    echo "Errada canviant password"
    exit 1
fi

#fer caducar el password
passwd -e ${USER_NAME}

#informam del que s'ha creat
echo "nom complet: ${COMMENTS}"
echo "Usuari creat: ${USER_NAME}"
echo "password generat: ${PASSWORD}"
echo "HostName: ${HOSTNAME}"

exit 0
