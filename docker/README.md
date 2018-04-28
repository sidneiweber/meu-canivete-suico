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

#### Docker Compose
```shell
# build = Indica o caminho do Dockerfile
build: .
# command = Executa um comando
command: bundle exec thin -p 3000
# container_name = Nome para container
container_name = servidor-web
# dns = Indica o dns server
dns: 8.8.8.8
#dns_search = Especifica search domain
dns_search: example.com
# env_file = Especifica um arquivo de variáveis de ambiente
env_file: .env
# environment = Adiciona variáveis de ambiente
RACK: development
# expose = expõe a porta do container
expose:
- "3000"
- "8000"
# external_links = linka containers fora do compose
external_links:
- projeto_db:mysql
# image = Indica uma imagem
image: ubuntu:14.04
# links = linka containers do compose
links:
- db
- db:database
# net = modo de rede
net: "bridge"
net: "host"
# volumes = monta volumes
volumes:
- /var/www/html
```

#### Subindo duas imagens Wordpress e Mysql e as linkando
```shell
docker run -d --name=dbserver -e "MYSQL_ROOT_PASSWD=bolacha" -e "MYSQL_DATABASE=wordpress" mysql
docker run -d --name=wordpress -p 80:80 --link dbserver:mysql wordpress
```

#### Upando imagens para Docker Hub
```shell
docker tag debian-apache:v2 sidneiweber/servidorweb:v1
docker push sidneiweber/web:v1
```
