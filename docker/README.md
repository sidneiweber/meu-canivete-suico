# Docker
## Instalar
##### Instalando docker
```shell
curl -sSL https://get.docker.com | sh
```
## Comandos básicos
##### Baixar imagem
```shell
docker pull [nome da imagem]
```
##### Listar imagens
```shell
docker images
```
##### Iniciar container com a imagem baixada
```shell
docker run -it [nome da imagem ou id]
```
##### Listar containers
```shell
docker ps
```
##### Verifica todos os containers, inclusive os que não estão rodando
```shell
docker ps -a
```
##### Executa comandos no container
```shell
docker exec [id do container] [comando]
```
##### Sair do container sem fechar, usar a combinaço de teclas
```shell
control+p+q
```
##### Voltar para dentro de um container em execuço
```shell
docker attach [id do container]
```
##### Inspecionar o container (mostra muitos detalhes do container)
```shell
docker inspect [id do container]
```
##### Consumo do container no host
```shell
docker stats
CONTAINER           CPU %               MEM USAGE / LIMIT    MEM %               NET I/O             BLOCK I/O           PIDS
e8d6ad7a5b3b        0.03%               3.465MiB / 11.7GiB   0.03%               648B / 0B           0B / 4.1kB          6
```
##### Limitar memória do container
```shell
docker run -it -m 512M ubuntu /bin/bash
docker run -it -m 1G ubuntu /bin/bash
docker inspect [container id] |grep -i mem
```
##### Limitar CPU do container
```shell
docker run -it --cpu-shares 1024 ubuntu /bin/bash
docker inspect [container id] |grep -i cpu
```
##### Atualizar limite memória container em execução
```shell
docker update -m 256M [container id]
```
##### Atualizar limite CPU container em execução
```shell
docker update --cpu-shares 512 [container id]
```
##### Remover container
```shell
docker rm [id do container]
```

#### Iniciar bash em um container
```shell
docker exec -it <nome_container> bash
```
#### Fazendo dois containers se enxergarem (clever_poitras já estava rodando)
```shell
docker run -it --name web02 --link clever_poitras:web01 3d49e175ec00 /bin/bash
ping web01 # responde OK
```
#### Iniciar container com opções a mais
```shell
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
