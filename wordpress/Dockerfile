FROM php:7.2-apache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp && chmod +x /usr/local/bin/wp

RUN apt-get update \
    && apt-get install -y git \
    && apt-get install -y libfreetype6-dev \
    && apt-get install -y libicu-dev \
    && apt-get install -y libmcrypt4 libmcrypt-dev \
    && apt-get install -y libpng-dev libjpeg-dev \
    && apt-get install -y libxml2-dev \
    && apt-get install -y libxslt-dev \
    && apt-get install -y mysql-client \
    && apt-get install -y mysql-client \
    && apt-get install -y zlib1g-dev \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/lib --with-freetype-dir=/usr/lib/x86_64-linux-gnu \
    && docker-php-ext-install calendar \
    && docker-php-ext-install gd \
    && docker-php-ext-install intl \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install soap \
    && docker-php-ext-install xsl \
    && docker-php-ext-install zip \
    && docker-php-ext-install mysqli \
    && rm -rf /var/lib/apt/lists

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.max_nesting_level=500" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN a2enmod rewrite

WORKDIR /var/www/html
