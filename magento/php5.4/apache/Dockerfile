FROM occitech/php:5.4-apache

MAINTAINER occitech <contact@occitech.fr>

RUN apt-get -y install curl
RUN curl -o /usr/bin/n98-magerun https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar
RUN chmod +x /usr/bin/n98-magerun

RUN curl -sSL https://get.docker.io/ubuntu/ | sh

COPY ./bootstrap.sh /bootstrap.sh
ENTRYPOINT ["/bootstrap.sh"]

CMD ["/usr/bin/supervisord"]
