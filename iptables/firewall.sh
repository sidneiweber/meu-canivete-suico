#!/bin/bash
################################
# Autor: Eduardo Mota          #
# EMail: emota@emota.com.br    #
# URL: http://www.emota.com.br #
# Data: 25/02/04 - ver.: 1.0   #
################################

## Localizando Interface da Internet
inet=`route -n | awk '/UG/ {print $8}'`
if [ ! $inet ]; then {
  echo "Gateway não configurado."
  exit 1
}; fi

## Localizando Firewall
fw=`which iptables`
if [ ! $fw ]; then {
  echo "IPTables não encontrado."
  exit 2
}; fi


## Leia com atencao!
## Comente a linha abaixo para executar 
## Pra comentar a linha, basta incluir # no inicio
## Descomenta a linha para testar o script
t="echo"

if [ $1 ]; then {
  if [ $1 = "start" ]; then t=""; fi
}; fi

## Localizando PortScan
nmap=`which nmap`

## Limpando Regras Antigas
$t $fw -F
$t $fw -t nat -F

## Habilitando o IP-FORWARD (passagem de pacotes)
echo "1" > /proc/sys/net/ipv4/ip_forward

## Habilitando o MASCARAMENTO de pacotes (NAT)
$t $fw -t nat -A POSTROUTING -o $inet -j MASQUERADE

if [ $nmap ]; then {
  ## Localizando IP da Internet
  ip=`ifconfig $inet | awk '/inet/ {print $2}' | awk -F ":" '{print $2}'`

  ## Lozalizando Portas TCP abertas
  port_tcp=`nmap -n $ip -sT | awk -F "/" '/open/ { print $1 }'`

  ## Lozalizando Portas UDP abertas
  port_udp=`nmap -n $ip -sU | awk -F "/" '/open/ { print $1 }'`
      
  ## Bloqueando Acesso via Internet as Portas TCP abertas
  for i in $port_tcp; do $t $fw -A INPUT -p tcp -i $inet --dport $i -j DROP; done

  ## Bloqueando Acesso via Internet as Portas UDP abertas
  for i in $port_udp; do $t $fw -A INPUT -p udp -i $inet --dport $i -j DROP; done
      
} else {
  echo "NMAP não encontrado, o script pode não funcionar corretamente."
}; fi

if [ $t ]; then {
  echo -e '\n' "As configurações não foram ativadas," '\n' \
  "o script foi executado em forma de TESTE." '\n' \
  "Para executar ele normalmente, digite:" '\n' \
  "$0 start" '\n'
}; fi
