#!/bin/bash

# Verificar se é debian

# Verificar se versão é 8

# Verificar internet

# Verificar se é root

# Atualizar sistema
apt-get update; apt-get upgrade

# Instalar dependencias
#https://wiki.samba.org/index.php/Package_Dependencies_Required_to_Build_Samba
apt-get install acl attr autoconf bison build-essential \
  debhelper dnsutils docbook-xml docbook-xsl flex gdb krb5-user \
  libacl1-dev libaio-dev libattr1-dev libblkid-dev libbsd-dev \
  libcap-dev libcups2-dev libgnutls28-dev libjson-perl \
  libldap2-dev libncurses5-dev libpam0g-dev libparse-yapp-perl \
  libpopt-dev libreadline-dev perl perl-modules-5.2 pkg-config \
  python-all-dev python-dev python-dnspython python-crypto \
  xsltproc zlib1g-dev

#Instale o NTP
apt-get install ntp

vim /etc/ntp.conf

Apague todo o conteúdo do arquivo e insira o conteúdo a seguir:

server a.ntp.br iburst prefer
server b.ntp.br iburst prefer
driftfile /var/lib/ntp/ntp.drift
logfile /var/log/ntp
ntpsigndsocket /usr/local/samba/var/lib/ntp_signd/
restrict default kod nomodify notrap nopeer mssntp
restrict 127.0.0.1
restrict a.ntp.br mask 255.255.255.255 nomodify notrap nopeer noquery
restrict b.ntp.br mask 255.255.255.255 nomodify notrap nopeer noquery

Salve e saia do arquivo e reinicie o serviço:

/etc/init.d/ntp restart
