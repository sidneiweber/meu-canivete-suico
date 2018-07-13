# -*- coding: utf-8 -*-
"""
Created on Fri Mar 27 12:50:18 2015

@author: Janssen dos Reis Lima
"""
from zabbix_api import ZabbixAPI

zabbix_server = "http://127.0.0.1:1080" #Endereço ou IP ou FQDN do servidor do Zabbix.
username = "sidnei" #Informe usuario para acessar. Usuario com perfil de administrador do Zabbix, não necessariamente o 'admin' padrao.
password = "sidnei" #Senha

#Instanciando a API
#conexao = ZabbixAPI(server = zabbix_server, log_level=6)
conexao = ZabbixAPI(server = zabbix_server)
conexao.login(username, password)

# verificar versao zabbix
versao = conexao.api_version()
print "Versão do Zabbix Server: ", versao

# Exibir hosts cadastrados
hosts = conexao.host.get({"output": "extend", "sortfield": "name"})
for x in hosts:
    print x['available'], "-", x['hostid'], "-", x['name']

#Cadastrar hosts
#conexao.host.create({"host": "Centos",
#                 "interfaces": [ {"type": "1",
#                 "main": "1",
#                 "useip": "1",
#                 "ip": "19.168.0.1",
#                 "dns": "",
#                 "port": "10052"}],
#                 "groups": [{ "groupid": "2"}],
#                 "templates": [{ "templateid": "10001"}]})
