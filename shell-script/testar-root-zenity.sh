#########################################
#  usuarios.sh  - Trabalho de Adm Sistemas Linux  #
#  Thu Mar 29 12:12:51 2007             #
#  Copyright  2007  User Júlio Cesar da Silva        #
#  Email    julioconsultoria@gmail.com           #
#########################################

# Este é um script para verificar o usuário logado, caso não seja o root,
# ele poderá torna-se root se este for o seu desejo e ele tiver a senha.
# Foi usado a janela de Dialog zenity cuja sintaxe básica é zenity [opção]
# e cada opção gera uma janela diferente.
# Obs: Este script necessita do X esteja rodando, assim como o pacote
# zenity instalado. O arquivo também deve possuir a permissão de execução. considere o - (um traço)
#como se fosse - - (dois traços)

#!/bin/sh
# Este primeiro if verifica se o usuário é ou não root. o != indica a
# expressão diferente de. Caso ele não seja o root, executamos as linhas
# logo abaixo do if [$USER != 'root' ]. Ao contrario iremos para o
# ultimo else do script. Agradecimentos o Gabriel Falcão pela lógica.

if [ $USER != 'root' ]; then
    
# A opção warning gera uma caixa com um aviso chamando a atenção do usuário
    
zenity --warning --title="Root or not ROOT" --text="Salve, voce não é o root, seu usuario é o $USER."
YESNO='CondiçãoFalsaParaGerarEscolha'

# A opção error gera uma caixa de mensagem de erro,
# enquanto o question é um dialog de pergunta (questionamento)
if [ $YESNO != 'CondiçãoFalsaParaGerarEscolha' ]; then
zenity --error --title="NO ROOT" --text="Opção Invalida."

else

zenity --question --title="Root or not ROOT" --text="Caso você deseja torna-se root clique em ok, se não, clique em cancelar"

fi

# Clicando em OK o usuário automaticamente gera uma saida 0 (TRUE)
# e se for um cancel ele irá gerar um 1 (FALSE). Utilizaremos estas saidas
# para retornar ao usuário o terminal como root ou parar o processo.
    
if [ $? != 1 ]; then

zenity --warning --title="Voce pode agir como Root" --text="Clique no ok e o terminal como root serah exibido, na primeira vez que estiver executando este script a senha serah requirida"

sleep 1

gksu gnome-terminal;
   
else

zenity --warning --title="Você nao é o root" --text="Fez a escolha certa Padawan $USER, ser o root é uma grande responsabilidade, tente novamente quando terminar o seu treinamento."
    
fi

# Este ultimo else aparecerá somente se for o root tiver executado o script.
 
else

zenity --info --title="Usuário ROOT" --text="Saudações administrador da maquina $HOSTNAME"

zenity --info --title="Usuário ROOT" --text="A tua vontade é a responsabilidade do Sistema!"
       
fi
