#!/bin/sh
# Shell Script escrito por
# ¤D Sidnei Henrique Weber

echo Digite o texto
read TXT1
#TXT1='Oi o i tt'

TXT1=`echo $TXT1 | tr ' ' '.'`   # Troca os espaços por pontos

echo $TXT1         # Mostra a mensagem
