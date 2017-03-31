#!/bin/bash
# Alertar espaço em disco quando chegar a 90%
df -k | grep -e [8-9][0-9]% | awk '{ print $4 " " $7 }' | while read output;
do
echo $output
usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1 )
partition=$(echo $output | awk '{ print $2 }' )
if [ $usep -ge 90 ]; then
echo "Verifique o diretorio "$partition" com ($usep%) de uso no servidor $(hostname)" | mail -s "Alerta! Disco excedido em $usep%" seu_email@provedor.com
fi
done
