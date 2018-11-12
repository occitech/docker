FROM php:5.6-apache

ENV N98_MAGERUN_VERSION 1.102.0
ENV N98_MAGERUN_URL https://files.magerun.net/n98-magerun.phar

ENV PHP_INI_DIR /usr/local/etc/php
ENV APACHE_LOG_DIR ../../var/log/apache2

RUN curl $N98_MAGERUN_URL > /usr/local/bin/n98-magerun \
    && chmod +x /usr/local/bin/n98-magerun 

RUN requirements="libpng-dev libmcrypt-dev libmcrypt4 libcurl3-dev libfreetype6 libjpeg62-turbo libfreetype6-dev libjpeg62-turbo-dev mysql-client" \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install mbstring \
    && requirementsToRemove="libpng-dev libmcrypt-dev libcurl3-dev libfreetype6-dev libjpeg62-turbo-dev" \
    && apt-get purge --auto-remove -y $requirementsToRemove

RUN usermod -u 1000 www-data
RUN a2enmod rewrite
RUN sed -i -e 's/\/var\/www\/html/\/var\/www\/htdocs/' /etc/apache2/apache2.conf

WORKDIR /var/www/htdocs

COPY ./bin/set-base-url /usr/local/bin/set-base-url
