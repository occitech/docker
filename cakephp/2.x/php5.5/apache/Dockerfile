FROM php:5.5-apache

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install php5-mysql php5-mcrypt curl \
    && php5enmod mcrypt \
    && curl -sSL https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \

ADD ./default.conf /etc/apache2/sites-available/000-default.conf

ADD ./bootstrap.sh /cakephp-bootstrap.sh
ENTRYPOINT ["/cakephp-bootstrap.sh"]

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
