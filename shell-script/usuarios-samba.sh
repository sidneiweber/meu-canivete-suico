#!/bin/bash


#
# Por: David Job 	Fevereiro/2009
#


while : ; do

opcao=$(dialog \
--stdout \
--title "Cadastramento de Usuarios no Samba" \
--backtitle "Viva o Linux"  \
--ok-label Escolher \
--no-cancel \
--menu "MENU PRINCIPAL" \
20 55 6 \
1 "INCLUIR" \
2 "EXCLUIR" \
3 "ALTERAR" \
4 "CONSULTA" \
5 "CREDITOS" \
6 "SAIR" )

[ $? -ne 0 ] && break

case "$opcao" in
	1) proxima=ra
	   while : ; do
	   case "$proxima" in
   	   ra)
		ra=$(dialog --stdout --title "Cadastro de Usuarios" --backtitle "Viva o Linux" --ok-label Proximo --cancel-label Menu --inputbox "RA: " 10 30 "${ra}")
		if [ $? -eq 0 ]; then
			if [ -z "$ra" ]; then
				dialog --title "Aviso" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "RA Obrigatorio!" 5 20
		 	else
				id $ra
				if [ $? -eq 1 ]; then
					proxima=nome
				else
					dialog --title "Aviso" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "RA ja Cadastrado!" 5 23
				fi
		 	fi
		else
		 	break
		fi
		;;
	   nome)
		nome=$(dialog --stdout --title "Cadastro de Usuarios" --backtitle "Viva o Linux" --ok-label Proximo --cancel-label Voltar --inputbox "Nome Completo: " 10 50 "${nome}")
		if [ $? -eq 0 ]; then
			if [ -z "$nome" ]; then
				dialog --title "Aviso" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "Nome Completo Obrigatorio!" 5 30
		 	else
				proxima=fim
			fi
		else
			proxima=ra
		fi
		;;
	   fim)
		useradd -g nogroup -c "$nome" -d /dev/null -s /bin/false $ra
		smbpasswd -a $ra

		if [ $? -eq 0 ]; then
                        dialog --no-shadow --title "Cadastro de Usuarios" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "Cadastro concluido com sucesso." 5 35
                        proxima=end
                else
                 	dialog --title "Erro" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "A senha nao confere. Tente novamente." 5 45
                        proxima=fim
		fi
		;;
	  end)
		ra=""
		nome=""
		break
		;;
	   *)
		echo "Janela desconhecida '$proxima' ."
		echo Abortando programa...
		exit
	esac
	
	[ $? -eq 1 ] && proxima=$anterior	## Cancelar
	[ $? -eq 255 ] && break			## Esc
	done
	;;
	2) proxima=primeira
	   while : ; do
	   case "$proxima" in
	   saida) break ;;
	   primeira)
		ra=$(dialog --stdout --title "Exclusao de Usuarios" --backtitle "Viva o Linux" --ok-label Pesquisar --cancel-label Menu --inputbox "RA: " 10 33)
		if [ $? -eq 0 ]; then
			if [ -z "$ra" ]; then
				dialog --title "Aviso" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "RA Obrigatorio!" 5 20
		 	else
				id $ra
				if [ $? -eq 0 ]; then
					dialog --title "Atencao" --backtitle "Viva o Linux" --yesno "Deseja realmente excluir o usuario?" 5 40
					if [ $? -eq 0 ]; then
						proxima=segunda
					else
						proxima=primeira
					fi
				else
					dialog --title "Aviso" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "RA nao Cadastrado!" 5 23
				fi
		 	fi
		else
			proxima=saida
		fi
	   ;;
       segunda)
		pdbedit -x -u $ra
		userdel -r $ra
		dialog --title "Exclusao de Usuarios" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "Usuario removido do sistema." 5 35
		ra=""
		nome=""
		break
		;;
	   *)
		echo "Janela desconhecida '$proxima' ."
		echo Abortando programa...
		exit ;;
	   esac
	   [ $? -eq 1 ] && proxima=$anterior	## Cancelar
	   [ $? -eq 255 ] && break		## Esc
	   done
	;;
	3)
	  proxima=primeira
	   while : ; do
	   case "$proxima" in
	   primeira)
   	    ra=$(dialog --stdout --title "Alteracao de Usuarios" --backtitle "Viva o Linux" --ok-label Pesquisar --cancel-label Menu --inputbox "RA: " 10 33)
	    if [ $? -eq 0 ]; then
		if [ -z "$ra" ]; then
			dialog --title "Aviso" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "RA Obrigatorio!" 5 20
	 	else
			proxima=senha
		fi
	    else
		break
	    fi
	    ;;
	    senha)
			x=$(id $ra)
			if [ $? -eq 0 ]; then
				smbpasswd $ra
				if [ $? -eq 1 ]; then
					dialog --title "Erro" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "A senha nao confere. Tente novamente!" 5 42
					proxima=senha
				else
					proxima=end
				fi
			else
				dialog --title "Aviso" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "RA nao Cadastrado!" 5 23
				proxima=primeira
			fi
	    ;;
	    end)
		ra=""
		nome=""
		dialog --title "Aviso" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "Senha alterada com sucesso." 5 33
		break
	    ;;
	    esac
		[ $? -eq 1 ] && proxima=$anterior    ## Cancelar
		[ $? -eq 255 ] && break              ## Esc
	    done
	;;
	4)
	  ra=$(dialog --stdout --title "Consulta de Usuarios" --backtitle "Viva o Linux" --ok-label Pesquisar --cancel-label Menu --inputbox "RA: " 10 33)
	  if [ $? = 0 ]; then
	  	if [ -z "$ra" ]; then
			dialog --title "Aviso" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "RA Obrigatorio!" 5 20
		else
			x=$(id $ra)
                        if [ $? -eq 0 ]; then
				search=$(finger $ra)
				dialog --title "Consulta de Usuarios" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "$search" 20 50
			else
				 dialog --title "Aviso" --backtitle "Viva o Linux" --ok-label "Ok" --msgbox "RA nao Cadastrado!" 5 23
			fi
		fi
	  fi
	ra=""
	nome=""
	;;

	5)
	   dialog --stdout --title "Desenvolvedor" --backtitle "Viva o Linux" --ok-label Ok --msgbox "\nDavid Job da Silva\n\n\nNucleo de Informatica - POLICAMP" 10 38 

	;;

	6) clear; exit ;;

esac

done
