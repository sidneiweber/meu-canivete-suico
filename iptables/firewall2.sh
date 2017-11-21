#!/bin/sh

echo "####################ATIVANDO IPTABLES#######################"
### Passo 1: Limpando as regras ###
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -F POSTROUTING -t nat
iptables -F PREROUTING -t nat
iptables -F -t nat

echo "Limpando as regras ...................................[ OK ]"

# Definindo a Politica das Cadeias
iptables -P INPUT REJECT
iptables -P FORWARD REJECT
iptables -P OUTPUT ACCEPT
echo "Politica das Cadeias .........................[ OK ]"

### Passo 2: Desabilitar o trafego IP entre as placas de rede ###
echo "0" > /proc/sys/net/ipv4/ip_forward
echo "Desabilitar o trafego IP entre as placas .............[ OK ]"

# Configurando a Protecao anti-spoofing
echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter
#for spoofing in /proc/sys/net/ipv4/conf/*/rp_filter; do
# echo "1" > $spoofing
#done
echo "Protecao anti-spoofing ...............................[ OK ]"
###########setando protecao contra ataques
echo 1 > /proc/sys/net/ipv4/tcp_syncookies
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
for i in /proc/sys/net/ipv4/conf/*; do
echo 0 >$i/accept_redirects
echo 0 >$i/accept_source_route
echo 1 >$i/log_martians
echo 1 >$i/rp_filter;
done
echo "Protecao contra ataques ..............................[ OK ]"

# Impedimos que um atacante possa maliciosamente alterar alguma rota
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
echo "Impedimos alterar alguma rota ........................[ OK ]"

# Utilizado em diversos ataques, isso possibilita que o atacante determine o "caminho" que seu
# pacote vai percorrer (roteadores) ate seu destino. Junto com spoof, isso se torna muito perigoso.
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
echo "Impossibilita que o atacante determine o "caminho" .....[ OK ]"

# Protecao contra responses bogus
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
echo "Protecao contra responses bogus ......................[ OK ]"

# Protecao contra ataques de syn flood (inicio da conexao TCP). Tenta conter ataques de DoS.
echo 1 > /proc/sys/net/ipv4/tcp_syncookies
echo "Protecao contra ataques de syn .......................[ OK ]"

### Passo 3: Carregando os modulos do iptables ###
# Ativa modulos
modprobe iptable_nat
modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ip_nat_ftp
modprobe ipt_LOG
modprobe ipt_REJECT
modprobe ipt_MASQUERADE
modprobe ipt_GRE
echo "Carregando os modulos ................................[ OK ]"

### Pacotes
iptables -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT
#iptables -A OUTPUT -m state --state ESTABLISHED, RELATED, NEW -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
echo "Pacotes ..............................................[ OK ]"

### Ativando o mascaramento (nat)
iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo "Ativando Mascaramento ................................[ OK ]"

######

# Redireciona porta 80 para 3128 (squid)
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3128

# PORTA 3128 - ACEITA PARA A REDE LOCAL
iptables -A FORWARD -i eth0 -p tcp --dport 3128 -j ACCEPT
echo "Redireciona porta 80 para 3128 .......................[ OK ]"
# PORTA 110 - ACEITA PARA A REDE LOCAL
iptables -A FORWARD -i eth0 -p tcp --dport 110 -j ACCEPT
iptables -A FORWARD -i eth0 -p udp --dport 110 -j ACCEPT
echo "PORTA 110 ............................................[ OK ]"
# PORTA 25 - ACEITA PARA A REDE LOCAL
iptables -A FORWARD -i eth0 -p tcp --dport 25 -j ACCEPT
echo "PORTA 25 .............................................[ OK ]"
# PORTA 443 - ACEITA PARA A REDE LOCAL
iptables -A FORWARD -i eth0 -p tcp --dport 443 -j ACCEPT
echo "PORTA 443 ............................................[ OK ]"
# PORTA 67 - ACEITA A CONECÇÃO DO DHCP
iptables -A FORWARD -i eth0 -p tcp --dport 67 -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 86 -j ACCEPT
iptables -A FORWARD -i eth0 -p udp --dport 67 -j ACCEPT
iptables -A FORWARD -i eth0 -p udp --dport 86 -j ACCEPT
echo "PORTA 67 .............................................[ OK ]"
# https
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p udp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p udp --dport 8080 -j ACCEPT
echo "https ................................................[ OK ]"
# PORTA 21 - ACEITA PARA A REDE LOCAL
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A FORWARD -p tcp --dport 21 -j ACCEPT
echo "PORTA 21 .............................................[ OK ]"
# PORTA 6881 - PROGRAMAS DE TORRENT'S
iptables -A INPUT -p tcp --dport 6881 -j ACCEPT
iptables -A INPUT -p udp --dport 6885 -j ACCEPT
iptables -A INPUT -p udp --dport 4444 -j ACCEPT
echo "PROGRAMAS DE TORRENT'S ...............................[ OK ]"
#bloqueia qualquer tentativa de nova conexao de fora para esta maquina
iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j REJECT
echo "bloqueia tentativa de nova conexao de fora ...........[ OK ]"

#no iptables, temos de dizer quais sockets sao validos em uma conexao
iptables -A INPUT -m state --state ESTABLISHED,RELATED,NEW -j ACCEPT
echo "Cadeia de Entrada ....................................[ OK ]"
#######################################################################
# No iptables, temos de dizer quais sockets sao validos em uma conexao#
#######################################################################
iptables -A FORWARD -m state --state ESTABLISHED,RELATED,NEW -j ACCEPT
echo "Sockets Sao Validos ..................................[ OK ]"
#################################################
################ Tabela FILTER ##################
#################################################
############ Proteção contra tronjans ###########
iptables -A INPUT -p TCP -i eth0 --dport 666 -j REJECT
iptables -A INPUT -p TCP -i eth0 --dport 4000 -j REJECT
iptables -A INPUT -p TCP -i eth0 --dport 6000 -j REJECT
iptables -A INPUT -p TCP -i eth0 --dport 6006 -j REJECT
iptables -A INPUT -p TCP -i eth0 --dport 16660 -j REJECT
echo "Proteção contra tronjans .............................[ OK ]"
############## Proteção contra worms #################
iptables -A FORWARD -p TCP -i eth0 --dport 135 -j REJECT
echo "Proteção contra worms ................................[ OK ]"
############# Proteção contra trinoo ##################
iptables -A INPUT -p TCP -i eth0 --dport 27444 -j REJECT
iptables -A INPUT -p TCP -i eth0 --dport 27665 -j REJECT
iptables -A INPUT -p TCP -i eth0 --dport 31335 -j REJECT
iptables -A INPUT -p TCP -i eth0 --dport 34555 -j REJECT
iptables -A INPUT -p TCP -i eth0 --dport 35555 -j REJECT
echo "Proteção contra trinoo ...............................[ OK ]"
######### Protecao contra acesso externo squid ###########
iptables -A INPUT -p TCP -i eth0 --dport 3128 -j REJECT
iptables -A INPUT -p TCP -i eth0 --dport 8080 -j REJECT
echo "Proteção contra squid externo.........................[ OK ]"
############# Protecao contra telnet #############
iptables -A INPUT -p TCP -i eth0 --dport telnet -j REJECT
echo "Proteção contra telnet ...............................[ OK ]"
# Proteções diversas contra portscanners, ping of death, ataques DoS, etc.
iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
iptables -A FORWARD -p tcp -m limit --limit 1/s -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT
iptables -A FORWARD --protocol tcp --tcp-flags ALL SYN,ACK -j REJECT
iptables -A FORWARD -m unclean -j REJECT
iptables -A INPUT -m state --state INVALID -j REJECT
iptables -N VALID_CHECK
iptables -A VALID_CHECK -p tcp --tcp-flags ALL FIN,URG,PSH -j REJECT
iptables -A VALID_CHECK -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j REJECT
iptables -A VALID_CHECK -p tcp --tcp-flags ALL ALL -j REJECT
iptables -A VALID_CHECK -p tcp --tcp-flags ALL FIN -j REJECT
iptables -A VALID_CHECK -p tcp --tcp-flags SYN,RST SYN,RST -j REJECT
iptables -A VALID_CHECK -p tcp --tcp-flags SYN,FIN SYN,FIN -j REJECT
iptables -A VALID_CHECK -p tcp --tcp-flags ALL NONE -j REJECT
echo "Prtecoes Diversas ....................................[ OK ]"
# Dropa pacotes TCP indesejaveis
iptables -A FORWARD -p tcp ! --syn -m state --state NEW -j REJECT
echo "Dropa pacotes mal formados ...........................[ OK ]"
# ProteÃ§ contra syn-flood
iptables -A FORWARD -p tcp --dport 135 -i eth0 -j REJECT
echo "Protecao contra syn-flood ............................[ OK ]"
# ProteÃ§ contra ping da morte
iptables -A FORWARD -p tcp --syn -m limit --limit 2/s -j ACCEPT
echo "ProteÃ§ contra ping da morte .........................[ OK ]"
iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
echo "Caregando tabela filter ..............................[ OK ]"

# Loga tentativa de acesso a determinadas portas
iptables -A INPUT -p tcp --dport 22 -i eth0 -j LOG --log-prefix "FIREWALL: ssh: "
iptables -A INPUT -p tcp --dport 21 -i eth0 -j LOG --log-prefix "FIREWALL: ftp: "
iptables -A INPUT -p tcp --dport 23 -i eth0 -j LOG --log-prefix "FIREWALL: telnet: "
iptables -A INPUT -p tcp --dport 25 -i eth0 -j LOG --log-prefix "FIREWALL: smtp: "
iptables -A INPUT -p tcp --dport 80 -i eth0 -j LOG --log-prefix "FIREWALL: http: "
iptables -A INPUT -p tcp --dport 110 -i eth0 -j LOG --log-prefix "FIREWALL: pop3: "
iptables -A INPUT -p udp --dport 111 -i eth0 -j LOG --log-prefix "FIREWALL: rpc: "
iptables -A INPUT -p tcp --dport 113 -i eth0 -j LOG --log-prefix "FIREWALL: identd: "
iptables -A INPUT -p tcp --dport 137:139 -i eth0 -jLOG --log-prefix "FIREWALL: samba: "
iptables -A INPUT -p udp --dport 137:139 -i eth0 -j LOG --log-prefix "FIREWALL: samba: "
iptables -A INPUT -p tcp --dport 161:162 -i eth0 -j LOG --log-prefix "FIREWALL: snmp: "
iptables -A INPUT -p tcp --dport 6881 -i eth0 -j LOG --log-prefix "FIREWALL: torrent: "
iptables -A INPUT -p udp --dport 6885 -i eth0 -j LOG --log-prefix "FIREWALL: torrent: "
iptables -A INPUT -p udp --dport 4444 -i eth0 -j LOG --log-prefix "FIREWALL: torrent: "
iptables -A INPUT -p tcp --dport 6667:6668 -i eth0 -j LOG --log-prefix "FIREWALL: irc: "
iptables -A INPUT -p tcp --dport 3128 -i eth0 -j LOG --log-prefix "FIREWALL: squid: "
echo "Negando portas indesejadas ...........................[ OK ]"

##Algumas portas devem ser negadas.
iptables -A INPUT -p tcp --dport 1433 -j REJECT
iptables -A INPUT -p tcp --dport 6670 -j REJECT
iptables -A INPUT -p tcp --dport 6711 -j REJECT
iptables -A INPUT -p tcp --dport 6712 -j REJECT
iptables -A INPUT -p tcp --dport 6713 -j REJECT
iptables -A INPUT -p tcp --dport 12345 -j REJECT
iptables -A INPUT -p udp --dport 12345 -j REJECT
iptables -A INPUT -p tcp --dport 12346 -j REJECT
iptables -A INPUT -p udp --dport 12346 -j REJECT
iptables -A INPUT -p tcp --dport 20034 -j REJECT
iptables -A INPUT -p tcp --dport 31337 -j REJECT
iptables -A INPUT -p udp --dport 31337 -j REJECT
iptables -A INPUT -p tcp --dport 6000 -j REJECT
echo "Negando portas invalidas .............................[ OK ]"

#Traceroutes caindo

iptables -A INPUT -p udp --dport 33434:33523 -j REJECT
iptables -A INPUT -p tcp --dport 113 -j REJECT
iptables -A INPUT -p igmp -j REJECT
iptables -A INPUT -p tcp --dport 80 -j REJECT
iptables -A INPUT -p tcp --dport 443 -j REJECT

echo "Rejeitando lixo :.....................................[ OK ]"

###BLOQUEANDO TODAS AS SAIDAS E PORTAS
iptables -A INPUT -p all -j REJECT
iptables -A FORWARD -p all -j REJECT
echo "Rejeitando saida e entrada ...........................[ OK ]"
########################

# Esta regra � o cora��o do firewall,
# ela bloqueia qualquer conex�o que n�o tenha sido permitida acima, justamente por isso ela � a �ltima da cadeia.
iptables -A INPUT -p tcp --syn -j REJECT
echo "Bloqueia tudo :.......................................[ OK ]"


# Finalmente: Habilitando o trafego IP, entre as Interfaces de rede
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "Habilitar o trafego IP entre as placas: ..............[ OK ]"

echo "##################FIM DE REGRAS IPTABLES####################"
echo "####################FIREWALL ATIVADO#######################"
exit 0
