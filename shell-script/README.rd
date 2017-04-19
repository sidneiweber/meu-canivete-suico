## Parâmetros
$@ ou $* - Todos os parâmetros a partir de $1.
$# - O número de parâmetros passados.
$$ - Pid do processo atual.
$0 - O nome do script.

## Comandos Test
-eq igual
-ne diferente
-gt maior
-lt menor
-o ou
-d se é diretório
-e se existe
-z se estiver vazio
-f se contém texto
-o se o usuário for o dono
-r se o arquivo pode ser lido
-w se o arquivo pode ser alterado
-x se o arquivo pode ser executado

``` 
if [ -e $linux ]
then
echo 'A variável $linux existe.'
else
echo 'A variável $linux não existe.'
fi
```
