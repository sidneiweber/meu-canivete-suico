#!/bin/bash
# instalar-nagios-debian.sh
# Criado por Sidnei Weber

# Variaveis
VERSAO_NAGIOS=4.2.4
VERSAO_PLUGINS=2.1.4
USUARIO=`whoami`

# Verificar se é root
if [ "$USUARIO" == "root" ]
then
	echo "O poder está em suas mãos!"
else
	echo "Você precisa ter poderes de Super Vaca!"
	exit 0
fi

# Verificar internet
clear
echo "Verificando conexão com internet"
curl www.google.com &> /dev/null
if [ "$?" != "0" ]; then
  echo "Sem conexao. Saindo do instalador"
  exit 0
 else
  echo "Conexao ok. Continuando!"
fi

# Instalação das dependencias
echo "Instalando dependencias"
apt-get install wget build-essential apache2 php-gd libgdchart-gd2-xpm libgdchart-gd2-xpm-dev libapache2-mod-php

# Baixando Nagios
# Nagios core
https://assets.nagios.com/downloads/nagioscore/releases/nagios-$VERSAO_NAGIOS.tar.gz
# Nagios plugins
https://nagios-plugins.org/download/nagios-plugins-$VERSAO_PLUGINS.tar.gz
# Extrair pacotes
tar -xzvf https://assets.nagios.com/downloads/nagioscore/releases/nagios-$VERSAO_NAGIOS.tar.gz
# Nagios plugins
tar -xzvf https://nagios-plugins.org/download/nagios-plugins-$VERSAO_PLUGINS.tar.gz

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
echo "Reiniciando Apache"
service apache2 restart

# Criar usuario e senha para acessar NAGIOS
echo "Escolha uma senha para o usuário nagiosadmin."
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

# Compilar plugins
cd ..
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
