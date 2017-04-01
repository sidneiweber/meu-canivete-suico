#!/bin/bash

# Variaveis

# Verificar se é root

# Verificar internet
clear
echo "Verificando conexão com internet"
curl www.google.com &> /dev/null
if [ "$?" != "0" ]; then
  echo "Sem conexao. Saindo do instalador"
  exit
 else
  "Conexao ok. Continuando!"
fi

# Instalação das dependencias
echo "Instalando dependencias"
apt-get install wget build-essential apache2 php-gd libgdchart-gd2-xpm libgdchart-gd2-xpm-dev libapache2-mod-php

# Baixando Nagios
# Nagios core

# Nagios plugins

# Extrair pacotes
tar -xzvf 
tar -xzvf

# Adicionar usuario e grupo
useradd nagios
groupadd nagios
usermod -a -G nagios nagios
usermod -a -G nagios www-data

# Compilar Nagios
cd nagios
./configure --with-command-group=nagios
make all
make install
make install-init
make install-config
make install-commandmode
make install-webconf

# Reiniciar apache
service apache2 restart

# Criar usuario e senha para acessar NAGIOS
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

# Compilar plugins
cd nagios-plugins
./configure --with-nagios-user=nagios --with-nagios-group=nagios
make
make install

# Habilitar CGI no apache
cp /etc/apache2/mods-available/cgi.load /etc/apache2/mods-enable/
service apache2 reload

# Verificar configuracao
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

# Iniciar instancia
/usr/local/nagios/bin/nagios -d /usr/local/nagios/etc/nagios.cfg
