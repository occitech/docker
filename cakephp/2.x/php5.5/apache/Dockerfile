FROM occitech/php:5.5-apache

MAINTAINER occitech <contact@occitech.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y install php5-mysql php5-mcrypt && php5enmod mcrypt
RUN apt-get -y install curl && curl -sSL https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer

ADD ./default.conf /etc/apache2/sites-available/000-default.conf

RUN apt-get clean

ADD ./bootstrap.sh /cakephp-bootstrap.sh
ENTRYPOINT ["/cakephp-bootstrap.sh"]

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
