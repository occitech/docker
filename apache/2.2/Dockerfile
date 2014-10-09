FROM ubuntu:precise

MAINTAINER occitech <contact@occitech.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install apache2 && apt-get clean
RUN a2enmod rewrite

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

VOLUME ["/var/www"]
VOLUME ["/etc/apache2/"]
VOLUME ["/var/log/apache2"]

ADD ./default.conf /etc/apache2/sites-available/default

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
