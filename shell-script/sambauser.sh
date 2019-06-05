#!/bin/bash
  # mento báco escrito por leof - www.leofc.tk
  # Adicionado recursos para o SaMBa por
  # Tiago Cruz - tiagocruz@linuxrapido.org
  # Adicionar/Remover usuáos no Linux e no SaMBa
  # Versã0.1 criada em 10/10/2003
  # -----------------------------------------------------
  # Versã0.2 em 13/10/2003 por Tiago Cruz
  # Senha do usuáo criada junto com a o SaMBa, mas
  # necessita do pacote libgii
  # -----------------------------------------------------
  # Versã0.3 em 18/01/05 por Tiago Cruz
  # Adicionar com o visudo (pacote sudo) para um usuáo
  # mortal poder criar e deletar o povo :)
  # usuario ALL=(ALL) NOPASSWD: /usr/sbin/useradd
  # usuario ALL=(ALL) NOPASSWD: /usr/sbin/userdel
  # usuario ALL=(ALL) NOPASSWD: /usr/bin/smbpasswd
  # usuario ALL=(ALL) NOPASSWD: /usr/bin/passwd
  #######################################################
  Principal() {
     clear
     dir="Diretorio Atual : `pwd`"
     kernel="Kernel : `uname -r`"
     arquitetura="Arquitetura : `uname -m`"
     grupos=groups

     echo "+-------------------------------------------------+"
     echo "|               Utilies for LinuX                 |"
     echo "+-------------------------------------------------+"
     echo "| Adicionar/ Remover usuarios no SaMBa e no Linux |"
     echo "+-------------------------------------------------+"
     echo "| Escrito por:                                    |"
     echo "| Tiago Cruz - www.linuxrapido.org                |"
     echo "| Modificado por:                                 |"
     echo "| Sandro Roberto Vieira - sandro@datapar.com.py   |"
     echo "+-------------------------------------------------+"
     echo
     echo $dir
     echo $kernel
     echo $arquitetura
     echo
     echo "Opcoes:"
     echo "1. Adicionar um Usuario"
     echo "2. Deletar um Usuario"
     echo "3. Modificar senha de Usuario"
     echo "4. Listar Usuarios do Samba"
     echo "5. Sair"
     echo -n "Entre com a opcao desejada => "
     read opcao
     echo
     case $opcao in
        1) Adicionar ;;
        2) Deletar ;;
        3) Modificar ;;
        4) Listar ;;
        5) exit ;;
        *) "Opcao desconhecida." ; echo ; Principal ;;
     esac
  }

Listar() {
     echo "Lista Usuario Samba: "
    cat /etc/samba/smbpasswd | awk 'BEGIN{ FS=":" } { print "Usuario:" $1 "\t" "Id:" $2}'|more
     read msg
     echo "Lista Usuario do Sistema: "
    cat /etc/passwd | awk 'BEGIN{ FS=":" } { print "Usuario:" $1 "\t" "Id:" $3}' |more

     echo "Pressione qualquer tecla para continuar..."
     read msg
     Principal
   }

Adicionar() {
     echo -n "Entre com o login do usuario: "
     read login
     echo -n "Entre com o nome completo do usuario: "
     read nome
     echo -n "Entre com o Grupo do usuario: "
     read grupo
     #echo -n "Entre com o depto do usuáo: "
     #read depto
     echo -n "Entre com a senha do usuario: "
     stty -echo
     read senha
     stty echo
     echo
     echo "Mensagens do sistema: "
     echo
     ( echo $grupo ; echo $grupo ) | sudo groupadd -r -f $grupo
     sudo /usr/sbin/useradd $login -c "$nome" -g "$grupo" -d /home/user/$login -s  /bin/bash; echo "$senha" | sudo /usr/bin/passwd $login --stdin
     echo
     ( echo $senha ; echo $senha ) | sudo smbpasswd -s -a $login
     #smbpasswd -a $login $senha
     echo
     echo "Pressione qualquer tecla para continuar..."
     read msg
     Principal
  }

Modificar() {
     echo -n "Entre com o login do usuario para modificar a Senha: "
     read login
     #echo -n "Entre com o depto do usuáo: "
     #read depto
     echo -n "Entre com a senha do usuario para Modificar: "
     stty -echo
     read senha
     stty echo
     echo
     echo "Mensagens do sistema: "
     ( echo $senha ; echo $senha ) | sudo smbpasswd -s  $login
     echo "$senha" | sudo /usr/bin/passwd $login --stdin
#    echo
#     ( echo $senha ; echo $senha ) | sudo smbpasswd -s -a $login
     #smbpasswd -a $login $senha
#    ( echo $senha ; echo $senha ) | sudo smbpasswd -s -a $login
     #smbpasswd -a $login $senha
     echo
     echo "Pressione qualquer tecla para continuar..."
     read msg
     Principal
  }

Deletar() {
     echo -n "Entre com o login do usuario a deletar: "
     read login
     echo
     echo "Mensagens do sistema: "
     echo
     sudo /usr/bin/smbpasswd -x $login
     echo
     sudo /usr/sbin/userdel $login
     echo
     echo "Pressione qualquer tecla para continuar..."
     read msg
     Principal
  }
  Principal
