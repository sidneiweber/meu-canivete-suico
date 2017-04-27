# Anotações do Mysql
### Logar via terminal
```
mysql -h host -u usuario -p [ENTER]
```

### Criar banco de dados
```
create database nomedobanco;
```

### Editar banco
```
use nomedobanco;
```

### Criar tabela
```
create table nometabela(campos tipos...);
# Ex
create table usuario
(
id int,
nome varchar(255),
sobrenome varchar(255),
cidade varchar(255)
);
```

### Mostrar conteúdo da tabela
```
select * from nometabela;
```

### Exibir banco de dados
```
show databases;
```

### Exibir tabelas
```
show tables;
```

### Informações sobre uma tabela
```
describe nometabela;
```

### Exportar e importar tabelas
```
mysqldump -u user -p senha banco > banco.sql

mysql -u user -p senha banco < banco.sql
```
