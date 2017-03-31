# Docker
## Comandos básicos
##### Baixar imagem
docker pull [nome da imagem]
##### Listar imagens
docker images

docker run [nome da imagem ou id] # iniciar container com a imagem baixada

docker ps # listar containers

docker ps -a # Verifica todos os containers, inclusive os que estão parados

docker exec [id do container] [comando] # executa comandos no container

docker rm [id do container]

#### Iniciar bash em um container
```shell
docker exec -it <nome_container> bash
```
#### Iniciar container com opções a mais
```bash
docker run -it -p <porta_host>:<porta_container> --name <nome_container> <nome_imagem>
```

#### Verificar logs container
```shell
docker logs <nome_container>
```

#### Remover imagem baixada
```shell
docker rmi -f <nome_imagem>
```

#### Copiar arquivo do container para o host
```shell
docker cp <nome_container>:/caminho/no/container /caminho/no/host
```

# Salvando alterações de um container
```shell
root@black:/home/sidnei# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                  NAMES
f8d74ee7155a        7e616530e7ea        "/bin/bash"         12 minutes ago      Up 12 minutes       0.0.0.0:8080->80/tcp   lonely_mccarthy
root@black:/home/sidnei#

root@black:/home/sidnei# docker commit f8d74ee7155a debian-apache
sha256:9a232ff09aaf601dfbe487c3b20802079cd5e1a55115fb3a47473f9e44ab8bf0
root@black:/home/sidnei# docker images
REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
debian-apache         latest              9a232ff09aaf        4 seconds ago       226.9 MB
```
