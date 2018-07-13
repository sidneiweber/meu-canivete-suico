# Ansible
Algumas informações e exemplos sobre a ferramenta

### Commands adhoc
```shell
ansible <HOST_GROUP> -m ping

ansible all -m lineinfile -a "dest=/etc/group regexp='^(users:x:100:)(.*)' line='\1ldapusername,\2' state=present backrefs=yes"

```
https://ansible-tips-and-tricks.readthedocs.io/en/latest/ansible/commands/
