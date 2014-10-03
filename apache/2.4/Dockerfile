FROM ubuntu:utopic

MAINTAINER occitech <contact@occitech.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install supervisor
RUN mkdir -p /etc/supervisor/conf.d
RUN echo "[supervisord]" > /etc/supervisor/conf.d/supervisord.conf
RUN echo "nodaemon=true" >> /etc/supervisor/conf.d/supervisord.conf

RUN apt-get -y install apache2
RUN a2enmod rewrite
RUN echo "[program:apache2]" >> /etc/supervisor/conf.d/supervisord.conf
RUN echo "command=/bin/bash -c \"source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND\"" >> /etc/supervisor/conf.d/supervisord.conf

RUN if test -d /var/www; then rm -rf /var/www; fi

ADD ./default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80

CMD ["/usr/bin/supervisord"]
