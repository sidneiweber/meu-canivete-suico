## Parâmetros
```
$@ ou $* - Todos os parâmetros a partir de $1.
$# - O número de parâmetros passados.
$$ - Pid do processo atual.
$0 - O nome do script.
$1 - Parametro número 1
$2 - Paramentro número 2
$? - Código de retorno do último comando
```
## Comandos Test
```
-eq igual
-ne diferente
-gt maior
-ge maior ou igual
-lt menor
-le menor ou igual
-o ou
-d se é diretório
-e se existe
-z se estiver vazio
-f se contém texto
-o se o usuário for o dono
-r se o arquivo pode ser lido
-w se o arquivo pode ser alterado
-x se o arquivo pode ser executado
-G o grupo do arquivo é o do usuário atual
-O o dono do arquivo é o usuário atual
-s o tamanho do arquivo é maior que zero
-nt o arquivo é mais recente
-ot o arquivo é mais antigo
-ef o arquivo é o mesmo
-! negação
-a E (and)
-o Ou (or)
= Igual
!= diferente
```
``` 
if [ -e $linux ]
then
echo 'A variável $linux existe.'
else
echo 'A variável $linux não existe.'
fi
```
Negando
``` 
if ! [ -e $linux ]
then
echo 'A variável $linux não existe.'
else
echo 'A variável $linux existe.'
fi
```

## echo
Imprima uma string na saída padrão
```
-n - imprime sem alimentação de linha (mesma linha)
-e - habilita interpretação de texto
  \a - beep
  \n - nova linha
  \c - não alimenta linha
  \t - tabelamento horizontal
```

## Variáveis
```shell
${var:-texto} = Se var não está definida, retorna 'texto'
${#var} = Retorna o tamanho da string
${!var} = Executa o conteúdo de $var
${var:N} = Retorna o texto a partir da posição 'N'
${var:N:tam} = Retorna 'tam' caracteres a partir da posição 'N'
${var#texto} = Corta texto do inicio da string
${var%texto} = Corta texto do final da string
${var/texto/novo} = Substitui 'texto' por 'novo' uma vez
${var//texto/novo} = Substitui 'texto' por 'novo' sempre
```

## For
```shell
for VAR in LISTA; do
  comandos
done
```

## While
```shell
while CONDICAO;
  do
    comandos
  done
```

## Case
```shell
case $VAR in
  caso1) comandos;;
  caso2) comandos;;
esac
```

## Função
```shell
function nome_função()
{
comandos
}

nome_função()
{
comandos
}
```
