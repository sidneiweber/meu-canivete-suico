#!/bin/bash

zenity --title="Lista Simples" --width=400 --height=400 --list --text=" Linux" --column="Escolha uma Opção" Atualizar_sistema Acrescentar_repositorios_no_/etc/apt/sources.list Fedora_4 Mandrake_10

# --column="Distribuição" --column="Versão" 
resposta=$?
case $resposta in
0) sudo apt-get upgrade ;;
1) echo deb http://download.tuxfamily.org/3v1deb feisty eyecandy >> /etc/apt/sources.list ;;
2) exit 0 ;;
*) zenity -- msgbox "Ops, isto não deveria acontecer... :-)" ;;
esac
