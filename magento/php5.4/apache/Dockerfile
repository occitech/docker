FROM php:5.4-apache
MAINTAINER occitech <contact@occitech.fr>

ENV N98_MAGERUN_VERSION 1.91.0
ENV N98_MAGERUN_URL https://raw.githubusercontent.com/netz98/n98-magerun/$N98_MAGERUN_VERSION/n98-magerun.phar

RUN requirements="libpng12-dev libmcrypt-dev libcurl3-dev" \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install mysql \
    && docker-php-ext-install gd \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install curl \
    && apt-get purge --auto-remove -y $requirements

RUN curl -o /usr/local/bin/n98-magerun $N98_MAGERUN_URL \
    && chmod +x /usr/local/bin/n98-magerun

COPY ./bin/set-base-url /usr/local/bin/set-base-url
