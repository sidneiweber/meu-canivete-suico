FROM tutum/lamp
MAINTAINER PAAS EMAIL <sidnei.weber@gmail.com>

RUN apt-get update \
    && apt-get install -y phpmyadmin \
    && apt-get install -y libxml2-dev \
    && a2enmod rewrite

#RUN echo "AddType application/x-httpd-php .php" > /etc/apache2/mods-enabled/mime.conf
