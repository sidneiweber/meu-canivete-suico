#!/bin/bash

## Feito por Phylipe Soares
## E-mail: phylipesoares@gmail.com
## Use o quanto quiser, porem o nome e e-mail do criador devem ser preservados.

## Da o modelo do processador.
modelo=`cat /proc/cpuinfo | grep name | cut -c1- | cut -d : -f2`
## Pega os MHZ do processador.
mhz=`cat /proc/cpuinfo | grep MHz | cut -c1- | cut -d : -f2 | cut -d . -f1`
## Pega  a quantidade de cache do processador.
cache=`cat /proc/cpuinfo | grep cache | cut -c14- | cut -d : -f2`

clear
echo "Seu pc é um $modelo"
echo "O clock real é de $mhz MHz"
echo "Seu processador tem $cache de cache."
echo ""
echo ""
