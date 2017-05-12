### Alguns comandos do Linux

## apropos
Pesquisa comando pela descrição
```shell
apropos e-mail
```

## cut
Corta textos
```shell
# Exibe a coluna dois com delimitador ";"
cut -d';' -f2 tabela.txt
```

## expand
Troca a tabulação por espaços
```shell
expand -t 4 arquivo.txt
```

## head
Mostra as 10 primeiras linhas do arquivo. Opção -n mostra quantidade de linhas desejadas
```shell
head arquivo.txt
```

## join
Une linhas
join -j1 valor
join -j2 valor
join -j 1 arquivo1 arquivo2

## nl
Numerar linhas

## split
Dividir arquivos grandes em arquivos menores
split -4 arquivo1.txt arquivosaida

## tac
Mostra do fim para o começo um arquivo

## tail
Mostra as últimas 10 linhas de um arquivo
tail -n especifica o numero de linhas
tail -f mostra em tempo real as últimas linhas

## tr (-d -s)
Faz a troca de textos
Troca para maiusculas
cat arquivo.txt | tr a-z A-Z

Apaga toda letra a
cat arquivo.txt | tr -d a

Esconde valores repetidos
cat arquivo.txt | tr -s 1

## wc
Conta linhas, palavras e caracteres
-c conta caracteres
-l conta linhas
-w conta número palavras

## xargs
Executa comandos repetidos

## which
Acha o caminho completo do comando

# Criar partições
fdisk
cfdisk

## Formatar
mkfs
mkfs -t ext3 /dev/sda1
