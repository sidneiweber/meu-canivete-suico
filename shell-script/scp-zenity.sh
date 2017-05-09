#!/bin/bash

ARQUIVO=`zenity --file-selection --title="Escolha o arquivo a ser mandado!"`
 
PORTA=`zenity --entry --title="Qual a porta?" --text="Digite a porta da máquina de conexão"`

USE=`zenity --entry --title="Qual o usuario?" --text="Digite o usuário de conexão"`

IP=`zenity --entry --title="Qual o IP?" --text="Digite o IP da máquina de destino"`

scp -r -P$PORTA $ARQUIVO $USE@$IP:~ 

exit 0
