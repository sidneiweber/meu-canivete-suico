# Um exemplo de dockerfile

FROM debian:lastest
 
MAINTAINER Sidnei Weber <sidnei.weber@gmal.com>
 
RUN apt-get update
RUN apt-get install -y apache2
RUN /etc/init.d/apache2 start

# Com dockerfile escrito rodar o comando
# docker build -t producao/debian-apache:1.0 .
