#!/bin/bash

#en aquest script podrem passar tres arguments start, stop i status
#segon l'argument que passem donarem un missatge per pantalla que serà:
# starting, stopping, the status is ....
#si no és cap d'aquests valors la sortida serà: valor no vàlid...

#if [[ "${1}" = "start" ]]
#then
#    echo "Starting...."
#elif [[ "${1}" = "stop" ]]
#then
#    echo "Stopping...."
#elif [[ "${1}" = "status" ]]   
#then
#    echo "The status is...."
#else
#    echo "Enter a valid option...."
#fi

#ho farem amb CASE
case "${1}" in
    start|s|--start|starting)
        echo "Starting...."
        ;;
    stop)
        echo "Stopping...."
        ;;
    status)
        echo "The status is...."
        ;;
    *)
        echo "Enter a valid option...."
        ;;

esac
