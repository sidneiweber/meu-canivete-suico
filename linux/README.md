### Alterar hostname sem reiniciar
```shell
echo "novo-hostname" > /proc/sys/kernel/hostnane
```

### Os 10 comandos mais rodados no seu linux

Com este comando podemos conferir quais os 10 comandos mais rodados em nossa máquina:
```shell
history|awk '{print $2}'|awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -rn|head -10
```

### Evitando encerramento acidental de sessões bash
A sequência de teclas “CTRL+D” encerra uma sessão bash. Às vezes digitamos estas teclas por acidente e encerramos uma sessão acidentalmente.

Para evitar que isto ocorra, definimos a variável de ambiente IGNOREEOF:
  export IGNOREEOF=1

Desta forma, para encerrar uma sessão bash, precisamos digitar a sequência “CTRL+D” duas vezes ou então digitar “exit“.

Esta variável de ambiente deve ser definida no arquivo .bashrc.

### Configurando troca de senha de usuário no próximo login
chage -d 0 usuario

### Comando para saber quando foi instalado o seu Linux
ls -lct /etc | tail -1 | awk '{print $6, $7, $8}'