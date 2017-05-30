#!/bin/bash
HOSTNAME=`hostname`
clear #limpa a tela
echo "Digite seu nome:"
read nome
echo "Nome da máquina: $HOSTNAME"
echo
echo "----------------------------------------------------"
echo "----------------------------------------------------"
#echo "Essa é a quantidade de bogomips de seu processador... "
#echo
#cat /proc/cpuinfo |grep bogomips
#echo "-----------------------------------------------------"
#echo "O seu HD está particionado assim..."
#fdisk -l
#echo "-----------------------------------------------------"
#echo "A quantidade de memória é de:"
#echo
#free
#echo "-----------------------------------------------------"
#echo "----------------------------------------------------"
echo " Esses usuários estão logados no sistema:"
echo
who
echo "-----------------------------------------------------"
echo "-----------------------------------------------------"
#echo "Digite seu nome:"
#read nome
echo "Tenha um bom dia seu $nome"
echo "----------------------------------------------------"
echo "----------------------------------------------------"
