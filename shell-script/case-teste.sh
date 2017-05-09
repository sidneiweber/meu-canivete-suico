#!/bin/bash
if [ "$USER" = "sidnei" ]
	then echo "Ola bonitao"
		else echo "Ola qualquer um"
fi

echo "Escolhe um numero: ";read OPCAO
case $OPCAO in 
	1)
	echo "Escolhido 1"
	;;
	2)
	echo "Escolhido 2"
	;;
	*)
	echo "Nem um nem outro"
	exit
	;;
esac
