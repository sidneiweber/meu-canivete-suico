#!/bin/bash

#--window-icon=ICONPATH
produto=`zenity --width=300 --height=350 --list --title="Instalador de programas" --text="Selecione a opção a ser instalada" --column="Opções para instalação" "Instalar Openarena" "Instalar Urban Terror" "produto 3" "produto 4" "produto 5"`

test "$?" = "1" && exit 0

case $produto in
	"Instalar Openarena")
apt-get --force-yes install openarena openarena-data openarena-server|zenity --progress --percentage --auto-close --text="Instalando Openarena, aguarde pois vale a pena"
;;
	"Instalar Urban Terror")
echo Produto 2
;;
	"produto 3")
echo Produto 3
;;
	"produto 4")
echo Produto 4
;;
	"produto 5")
echo Produto 5
;;

esac
	


#test "$produto" = "produto 1" && zenity --info --text="Voce Selecionou o produto 1"
#test "$produto" != "produto 1" && zenity --info --text="Voce não selecionou oi produto 1"
