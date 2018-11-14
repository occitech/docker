FROM php:5.3-apache

ENV N98_MAGERUN_VERSION 1.96.1
ENV N98_MAGERUN_URL https://raw.githubusercontent.com/netz98/n98-magerun/$N98_MAGERUN_VERSION/n98-magerun.phar

RUN apt-get update && apt-get -y install php5-mysql php5-gd php5-mcrypt php5-curl

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/* \
    && curl -o /usr/local/bin/n98-magerun $N98_MAGERUN_URL \
    && chmod +x /usr/local/bin/n98-magerun

COPY ./default.conf /etc/apache2/sites-available/default

COPY ./bin/set-base-url /usr/local/bin/set-base-url

WORKDIR /var/www/htdocs
