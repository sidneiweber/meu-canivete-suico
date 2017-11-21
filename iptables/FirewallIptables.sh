#!/bin/sh
#
#  Script formatado por Daniel Fernandes - São Paulo - SP - Brasil
# E-mail: danwebmail@gmail.com
# www.vivaolinux.com.br/~volcom
# Fonte principal: www.vivaolinux.com.br
# 14/04/2009
#
##########       Mensagem de Inicialização do script
echo 'Iniciando a aplicação das Regras do Iptables...'
# Levando em consideração que eth0 = rede externa e eth1 = rede interna
##########          Ativa roteamento
echo 1 > /proc/sys/net/ipv4/ip_forward

##########          Limpa Regras nas tabelas Filters e NAT
iptables -F
iptables -F -t nat

##########          Bloqueia Todas Entradas e Saidas
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

##########          Permite ssh para o firewall na rede interna
iptables -A INPUT -p tcp -i eth1 -s 192.168.1.0/24 --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp -o eth1 -d 192.168.1.0/24 --sport 22 -j ACCEPT
iptables -A FORWARD -p tcp -i eth1 -s 192.168.1.0/24 --dport 22 -j ACCEPT
iptables -A FORWARD -p tcp -o eth1 -d 192.168.1.0/24 --sport 22 -j ACCEPT

##########          Cria mascaramento da rede interna com a Internet
iptables -A INPUT -d 192.168.1.4 -p tcp --dport 3128 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

#########          Modulos para permitir uso de FTP
iptables -A FORWARD -p tcp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 20:21 -j ACCEPT
iptables -A FORWARD -p udp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 20:21 -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 -i eth0 --sport 20:21 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT
iptables -A FORWARD -p udp -s 0/0 -i eth0 --sport 20:21 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT
# Essas duas linhas agradeço a ajuda do elgio (http://www.vivaolinux.com.br/perfil/verPerfil.php?login=elgio)
modprobe ip_nat_ftp
iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

##########          Permite comunicação com servidores  DNS
iptables -A FORWARD -p udp -s 192.168.1.0/24 --sport 1024: -d 0/0 --dport 53 -j ACCEPT
iptables -A FORWARD -p udp -s 0/0 --sport 53 -d 192.168.1.0/24 --dport 1024: -j ACCEPT

##########          Permite comunicação com protocolo HTTP
iptables -A FORWARD -p tcp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 -i eth0 --sport 80 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT

##########          Permite comunicação com protocolo HTTPS
iptables -A FORWARD -p tcp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 443 -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 -i eth0 --sport 443 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT

##########          Permite comunicação com protocolos 3DES, SHA1
iptables -A FORWARD -p udp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 40002 -j ACCEPT
iptables -A FORWARD -p udp -s 0/0 -i eth0 --sport 40002 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT
iptables -A FORWARD -p udp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 40003 -j ACCEPT
iptables -A FORWARD -p udp -s 0/0 -i eth0 --sport 40003 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT
iptables -A FORWARD -p udp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 40004 -j ACCEPT
iptables -A FORWARD -p udp -s 0/0 -i eth0 --sport 40004 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT

##########          Permite comunicaç com SERASA Porta 3006
iptables -A FORWARD -p tcp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 3006 -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 -i eth0 --sport 3006 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT

##########          Permite comunicação com Terminal Server
iptables -A FORWARD -p tcp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 3389 -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 -i eth0 --sport 3389 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT

##########          Permite a Rede Local pingar na Internet
iptables -A FORWARD -p icmp --icmp-type ping -s 192.168.1.0/24 -i eth1 -d 0/0 -o eth0 -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type pong -s 0/0 -i eth0 -d 192.168.1.0/24 -o eth1 -j ACCEPT

##########          Permite a Rede Local acessar um servidor POP3 na Internet
iptables -A FORWARD -p tcp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 110 -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 -i eth0 --sport 110 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT

##########          Permite a Rede Local acessar um servidor ESPECIFICO SMTP na Internet
iptables -A FORWARD -p tcp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 201.XXX.XXX.XXX -o eth0 --dport 25 -j ACCEPT
iptables -A FORWARD -p tcp -s 201.XXX.XXX.XXX -i eth0 --sport 25 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT

# Libera TUDO para um determinado IP da rede
# -s 192.168.1.20 = Ip da rede
# -d 192.168.1.4 = Ip do Proxy
iptables -A INPUT -s 192.168.1.20 -d 192.168.1.4 -j ACCEPT
iptables -A INPUT -s 192.168.1.4 -d 192.168.1.20 -j ACCEPT
iptables -A OUTPUT -s 192.168.1.20 -d 192.168.1.4 -j ACCEPT
iptables -A OUTPUT -s 192.168.1.4 -d 192.168.1.20 -j ACCEPT
iptables -A FORWARD -s 192.168.1.20 -d 192.168.1.4 -j ACCEPT
iptables -A FORWARD -s 192.168.1.4 -d 192.168.1.20 -j ACCEPT

##########          Permite comunicacao completa de um IP interno da rede para um determinado IP na Internet
########## IP 1
iptables -A FORWARD -s 192.168.1.20 -i eth1 -d 201.XXX.XXX.XXX -o eth0 -j ACCEPT
iptables -A FORWARD -s 201.XXX.XXX.XXX -i eth0 -d 192.168.1.20 -o eth1 -j ACCEPT

########## IP 2
iptables -A FORWARD -s 192.168.1.21 -i eth1 -d 201.XXX.XXX.XXX -o eth0 -j ACCEPT
iptables -A FORWARD -s 201.XXX.XXX.XXX -i eth0 -d 192.168.1.21 -o eth1 -j ACCEPT

##########          Permite comunicacao da rede interna com MySQL
iptables -A FORWARD -p tcp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 3306 -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 -i eth0 --sport 3306 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT

##########          Permite comunicacao da rede interna com VNC
iptables -A FORWARD -p tcp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 5900 -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 -i eth0 --sport 5900 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT

##########       Permite comunicacao com servidor SQL
iptables -A FORWARD -p tcp --sport 1433 -j ACCEPT
iptables -A FORWARD -p tcp --dport 1433 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 1433 -j DNAT --to-destination 192.168.1.6
iptables -t nat -A PREROUTING -i eth0 -p udp --dport 1433 -j DNAT --to-destination 192.168.1.6

##########          Permite conexao com Banco Indusval na  porta 1414
iptables -A FORWARD -p tcp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 1414 -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 -i eth0 --sport 1414 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT

##########           Permite comunicacao com Banco Rural na porta 8444
iptables -A FORWARD -p tcp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 8444 -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 -i eth0 --sport 8444 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT

##########          Permite comunicacao completa para Sabre
iptables -A FORWARD -s 0/0 -i eth1 -d 151.193.180.231 -o eth0 -j ACCEPT
iptables -A FORWARD -s 151.193.180.231 -i eth0 -d 0/0 -o eth1 -j ACCEPT
iptables -A FORWARD -s 0/0 -i eth1 -d 151.193.180.227 -o eth0 -j ACCEPT
iptables -A FORWARD -s 151.193.180.227 -i eth0 -d 0/0 -o eth1 -j ACCEPT
iptables -A FORWARD -s 0/0 -i eth1 -d 151.193.141.254 -o eth0 -j ACCEPT
iptables -A FORWARD -s 151.193.141.254 -i eth0 -d 0/0 -o eth1 -j ACCEPT
iptables -A FORWARD -s 0/0 -i eth1 -d 201.53.42.140 -o eth0 -j ACCEPT
iptables -A FORWARD -s 201.53.42.140 -i eth0 -d 0/0 -o eth1 -j ACCEPT

##########          Permite comunicacao com ReceitaNet
iptables -A FORWARD -p tcp -s 192.168.1.0/24 -i eth1 --sport 1024: -d 0/0 -o eth0 --dport 3456 -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 -i eth0 --sport 3456 -d 192.168.1.0/24 -o eth1 --dport 1024: -j ACCEPT

########            Direciona o Acesso remoto pra IP interno
iptables -A FORWARD -p tcp --sport 3389 -j ACCEPT
iptables -A FORWARD -p tcp --dport 3389 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 3389 -j DNAT --to-destination 192.168.1.87
iptables -t nat -A PREROUTING -i eth0 -p udp --dport 3389 -j DNAT --to-destination 192.168.1.87

#################################################################

##########          Redireciona os pacotes para porta 80 para a 3128
iptables -t nat -A PREROUTING -p tcp -s 192.168.1.0/24 -i eth1 -d 0/0 --dport 80  -j REDIRECT --to-port 3128

##########          Redireciona os pacotes para porta 8080 para a 3128
########## iptables -t nat -A PREROUTING -p tcp -s 192.168.1.0/24 -i eth1 -d 0/0 --dport 8080 -j REDIRECT --to-port 3128

##########          Redireciona os pacotes para porta 443 para a 3128
########## iptables -t nat -A PREROUTING -p tcp -s 192.168.1.0/24 -i eth1 -d 0/0 --dport 443 -j REDIRECT --to-port 3128

##########          Permite a entrada de pacotes para a porta 3128
iptables -A INPUT -s 192.168.1.0/24 -i eth1 -p tcp --dport 3128 -j ACCEPT

##########          Permite a Rede Local enviar pacotes para a porta 80 na Web
iptables  -A FORWARD -s 192.168.1.0/24 -p tcp --dport 80 -j ACCEPT

##########          Permite a Rede Local enviar pacotes para a porta 443 na Web
iptables  -A FORWARD -s 192.168.1.0/24 -p tcp --dport 443 -j ACCEPT

##########          Libera o PROXY, que está dentro do firewall pesquisar na web
iptables -A OUTPUT -p tcp -o eth0 -d -0/0 --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -i eth0 -s -0/0 --sport 443 -j ACCEPT

##########          Libera o PROXY, que está dentro do firewall pesquisar DNS
iptables -A OUTPUT -p udp -o eth0 -d -0/0 --dport 53 -j ACCEPT
iptables -A INPUT -p udp -i eth0 -s -0/0 --sport 53 -j ACCEPT

##########          Libera o retorno do pacotes do PROXY para a rede local
iptables -A OUTPUT -d 192.168.1.0/24  -o eth1 -p tcp --sport 3128 -j ACCEPT

##########          Libera o trafego interno da loopback com ela mesma
iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT

##########       Mensagem de finalização do script
echo 'As regras do Firewall Iptables foram atualizadas!' 
