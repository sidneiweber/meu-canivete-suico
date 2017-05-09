#!/bin/bash

# Escrito por Leandro Santiago da Silva
# e-mail: leandrosansilva@gmail.com
# Críticas, sugestões, enviarem para esse e-mail.

# Programa que verifica se você tem um mesmo arquivo em vários diretórios
# A checagem é feita via md5sum, o que faz com que mesmo que arquivoa diferentes tenham o mesmo nome, serem ainda sim considerados diferentes
# É possível jogar a lista dos arquivos repetidos num arquivo de log.




## A função echos eu retirei do programa funcoeszz (http://www.funcoeszz.net)

echos(){
   echo -e "\033[36;1m$*"; echo -ne "\033[m"
}

if [ -z $1 ]; then
  echo
  echo "Uso deste programa:"
  echo
  echos "$0 diretório-destino "
  echo
  echo "Mais informações, digite $0 --help"
  echo
  exit
fi

if [ $1 = '--help' ]; then
   echo
   echo "Uso deste programa:"
   echo
   echos "$0 diretório-destino "
   echos "$0 diretório-destino arquivo_de_log"
   echo
   echo "Escrito por Leandro Santiago da Silva"
   echo
   echo "leandrosansilva@gmail.com"
   echo
   exit
fi

if [ $1 = '--version' ]; then
   echo
   echos "Versão 0.0.0.0.0.1-beta"
   echos
   exit
fi
		
for ARQUIVO in * ; do
   if [ -e $1/$ARQUIVO 2> /dev/null ]; then
      if [ $( md5sum $ARQUIVO 2> /dev/null | cut -f1 -d' ') = $( md5sum $1/$ARQUIVO 2> /dev/null | cut -f1 -d' ' ) ]; then
      	echos $ARQUIVO 
        if [ ! -z $2 ]; then
	   echo $ARQUIVO >> $2
        fi
      fi
   fi
done 


