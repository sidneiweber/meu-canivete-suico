
from pyzabbix import ZabbixAPI

zapi = ZabbixAPI("http://127.0.0.1:1080")
zapi.login("sidnei", "sidnei")
print("Connected to Zabbix API Version %s" % zapi.api_version())

for h in zapi.host.get(output="extend"):
    print(h['hostid'])
