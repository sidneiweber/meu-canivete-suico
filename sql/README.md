# Anotações do Mysql
### Logar via terminal
```shell
mysql -h host -u usuario -p [ENTER]
```

### Criar banco de dados
```sql
create database nomedobanco;
```

### Editar banco
```sql
use nomedobanco;
```

### Criar tabela
```sql
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
```sql
select * from nometabela;
```

### Exibir banco de dados
```sql
show databases;
```

### Exibir tabelas
```sql
show tables;
```

### Informações sobre uma tabela
```sql
describe nometabela;
```

### Exportar e importar tabelas
```sql
mysqldump -u user -p senha banco > banco.sql

mysql -u user -p senha banco < banco.sql
```
