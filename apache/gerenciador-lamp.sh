#!/bin/bash


bkpApaconf()
{
dir=$( dialog --stdout --inputbox 'Para onde você quer que eu faça o Backup?' 0 0 )
if [ -d $dir ]
then
	cp /etc/apache2/apache2.conf $dir
else
	dialog                           \
   	--title '!! Erro !!'             \
   	--msgbox 'Diretório Não Existe'  \
   	6 40
fi
}

retryApa()
{
dialog --yesno 'Deseja Tentar denovo?' 0 0

if [ $? = 0 ]
then
	bkpApaconf
else
	grnApache
fi

}

bkpPhpini()
{
dir=$( dialog --stdout --inputbox 'Para onde você quer que eu faça o Backup?' 0 0 )
if [ -d $dir ]
then
	cp /etc/php5/apache2/php.ini $dir
else
	dialog                           \
   	--title '!! Erro !!'             \
   	--msgbox 'Diretório Não Existe'  \
   	6 40
fi
}

retryPHP()
{
dialog --yesno 'Deseja Tentar denovo?' 0 0

if [ $? = 0 ]
then
	bkpPhpini
else
	grnPHP
fi

}

tstphp()
{
echo "<?php phpinfo(); ?>" > /var/www/testephp.php
firefox http://localhost/testephp.php
}



grnPHP()
{
while : ; do

    # Mostra o menu na tela, com as ações disponíveis
    opt=$(
      dialog --stdout                          \
             --title 'Gerenciar PHP'           \
             --menu 'O quê você quer fazer:'   \
            0 0 0                              \
            1 'Editar o php.ini'               \
            2 'Fazer Backup do php.ini'        \
	    3 'Testar PHP'                     \
            0 'Voltar'                )

    # apertou CANCELAR ou ESC, então vamos sair...
    [ $? -ne 0 ] && exit 0

    # De acordo com a opção escolhida, dispara comandos
    case "$opt" in
         1) gedit /etc/php5/apache2/php.ini ;;
         2) bkpPhpini ;;
	 3) tstphp ;;
         0) break ;;
    esac

done
}


grnMysql()
{
while : ; do

    # Mostra o menu na tela, com as ações disponíveis
    opt=$(
      dialog --stdout                          \
             --title 'Gerenciar MySQL'         \
             --menu 'O quê você quer fazer:'   \
            0 0 0                              \
            1 'Parar o Mysql'                  \
            2 '(Re)iniciar o Mysql'            \
            0 'Voltar'                )

    # apertou CANCELAR ou ESC, então vamos sair...
    [ $? -ne 0 ] && exit 0

    # De acordo com a opção escolhida, dispara comandos
    case "$opt" in
         1)  /etc/init.d/mysql stop ;;
         2)  /etc/init.d/mysql restart ;;
         0) break ;;
    esac

done
}

grnApache()
{
while : ; do

    # Mostra o menu na tela, com as ações disponíveis
    opt=$(
      dialog --stdout               \
             --title 'Gerenciar Apache'  \
             --menu 'O quê você quer fazer:' \
            0 0 0                             \
            1 'Parar o Apache'                  \
            2 '(Re)iniciar o Apache'               \
            3 'Editar o apache.conf'            \
            4 'Fazer Backup do apache.conf' \
            0 'Voltar'                )

    # apertou CANCELAR ou ESC, então vamos sair...
    [ $? -ne 0 ] && exit 0

    # De acordo com a opção escolhida, dispara comandos
    case "$opt" in
         1)  /etc/init.d/apache2 stop ;;
         2)  /etc/init.d/apache2 restart ;;
         3)  gedit /etc/apache2/apache2.conf ;;
         4)  bkpApaconf ;;
         0) break ;;
    esac

done
}


bkpWww()
{

dir=$( dialog --stdout --inputbox 'Qual diretório é o seu DocumentRoot ?' 0 0 )
if [ -d $dir ]
then
	echo $dir
	tar -cf /tmp/bkpWww.tar $dir
else
	dialog                           \
   	--title '!! Erro !!'             \
   	--msgbox 'Diretório Não Existe'  \
   	6 40
fi

dest=$( dialog --stdout --inputbox 'Para onde você quer que eu faça o Backup?' 0 0 )
if [ -d $dir ]
then
	gzip -c9 /tmp/bkpWww.tar > $dest/bkpWww.tar.gz
else
	dialog                           \
   	--title '!! Erro !!'             \
   	--msgbox 'Diretório Não Existe'  \
   	6 40
fi
}

princ()
{
# codigo para manipular dialogs, copiado e modificado dos exemplos do aurélio http://aurelio.net/shell/dialog/ 
# Loop que mostra o menu principal
while : ; do

    # Mostra o menu na tela, com as ações disponíveis
    opt=$(
      dialog --stdout                          \
             --title 'Gerenciar Serviços Web'  \
             --menu 'O quê você quer fazer? '  \
            0 0 0                              \
            1 'Gerenciar Apache'               \
            2 'Gerenciar MySQL'                \
            3 'Gerenciar PHP'                  \
            4 'Fazer Backup do DocumentRoot'   \
            0 'Sair'                )

    # apertou CANCELAR ou ESC, então vamos sair...
    [ $? -ne 0 ] && break

    # De acordo com a opção escolhida, dispara comandos
    case "$opt" in
         1) grnApache ;;
         2) grnMysql ;;
         3) grnPHP ;;
         4) bkpWww ;;
         0) break ;;
    esac

done
}

princ
