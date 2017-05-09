#!/bin/bash
# Criado em:Seg 06/Abr/2009 hs 22:19
# Last Change: Seg 06/Abr/2009 hs 22:19
# Instituicao:
# Proposito do script:
# Autor:

dialog --msgbox 'Bem vindo ao SCPFácil modo texto' 5 40

ARQUIVO=$(dialog --title 'Escolha um arquivo' --fselect /home/sidnei 0 0)

USER=$(dialog --stdout --inputbox "Digite o nome do usuário de conexão:" 0 0)
test "$?" = "1" && exit 0
PORTA=$(dialog --stdout --inputbox "Digite a porta de conexão do computador remoto:" 0 0)
test "$?" = "1" && exit 0
IP=$(dialog --stdout --inputbox "Digite IP do computador remoto:" 0 0)
test "$?" = "1" && exit 0
