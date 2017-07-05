Servidor de monitoramento NAGIOS

### Instalação
Vide script

### Arquivos
cgi.cfg - Configurações para acesso a interface do Nagios

nagios.cfg - Configurações globais

resource.cfg - Configuração dos plugins



-- Objects
commands.cfg - Contém comandos dos plugins do Nagios

contacts.cfg - Configurações dos contatos para quem vai os alertas

localhost.cfg - Configuração do próprio servidor

printer.cfg - Exemplo de config para impressoras

templates.cfg - Config de templates de Host, Contatos, Serviços

timeperiods.cfg - Configurações dos horários de monitoramento

windows.cfg - Exemplo de config Windows

### Windows
Baixar o programa abaixo:
NSCLIENT

### Linux com NRPE
## No servidor
``shell
apt-get install nagios-nrpe-plugin
cp /usr/lib/nagios/plugins/check_nrpe /usr/local/nagios/libexec/
``
## No cliente
``shell
apt-get install nagios-nrpe-server
``
## Plugins
``shell
/usr/lib/nagios/plugins
vi /etc/nagios/nrpe.cfg
allowed_hosts=colocar ip nagios
``
No final inserir comandos de monitoração
``shell
# Exemplos:
command[check_loads]=/usr/lib64/nagios/plugins/check_load -w 5.0,4.0,3.0 -c 10.0,6.0,4.0
command[check_disk]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /
command[check_procs]=/usr/lib64/nagios/plugins/check_procs -w 250 -c 400 -s RSZDT
command[check_crond]=/usr/lib64/nagios/plugins/check_procs -a '/usr/sbin/crond -n' -u root -c 1:1
``
## Testando no servidor
``shell
/usr/local/nagios/libexec/check_nrpe -n -H 10.0.0.102 -c check_sda1
``
