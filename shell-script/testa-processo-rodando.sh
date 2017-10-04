#!/bin/bash
TOP=$(ps axu |grep mysql | cut -d" " -f1 |grep mysql)
#echo -n "Digite algo:"
#read TOP
#echo $TOP
test -z $TOP && echo "MYSQL testado que estava fora em $(date)" >> /opt/mysql.txt && cat /opt/mysql.txt | mail -s "Mysql fora do ar2" -c xandehp@gmail.com sidnei.weber@quantiza.com || echo MYSQL OK
rm -rf /opt/mysql.txt
#echo OK
#else
#echo NAO OK
#fi
