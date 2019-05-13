FROM php:7.2-apache

ENV N98_MAGERUN_URL https://files.magerun.net/n98-magerun.phar
ENV COMPOSER_URL https://getcomposer.org/composer.phar
ENV MODMAN_URL https://raw.githubusercontent.com/colinmollenhour/modman/master/modman
ENV REQUIREMENTS "libcurl3-dev libxml2-dev libjpeg62-turbo-dev mcrypt libmcrypt-dev \
                  libfreetype6 libjpeg62-turbo libpng-dev libfreetype6-dev libzip-dev"
ENV REQUIREMENTSTOREMOVE "libcurl3-dev libpng-dev libfreetype6-dev libjpeg62-turbo-dev \
                  libmcrypt-dev libzip-dev"

RUN curl -o /usr/local/bin/n98-magerun $N98_MAGERUN_URL \
    && chmod +x /usr/local/bin/n98-magerun

RUN curl -o /usr/local/bin/composer $COMPOSER_URL \
    && chmod +x /usr/local/bin/composer

RUN curl -o /usr/local/bin/modman $MODMAN_URL \
    && chmod +x /usr/local/bin/modman

RUN apt-get update && apt-get install -y $REQUIREMENTS && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure gd --with-gd --with-jpeg-dir \
        --with-png-dir --with-zlib-dir --with-freetype-dir=/usr/include/freetype2/ --with-freetype \
        --enable-gd-native-ttf \
    && docker-php-ext-install gd \
    && docker-php-ext-install soap \
    && docker-php-ext-install zip \
    && pecl install mcrypt-snapshot \
    && echo "extension=mcrypt.so" > /usr/local/etc/php/conf.d/mcrypt.ini \
    && apt-get purge --auto-remove -y $REQUIREMENTSTOREMOVE

RUN usermod -u 1000 www-data
RUN a2enmod rewrite
RUN sed -i -e 's/\/var\/www\/html/\/var\/www\/htdocs/' /etc/apache2/apache2.conf

WORKDIR /var/www/htdocs

COPY ./bin/set-base-url /usr/local/bin/set-base-url
