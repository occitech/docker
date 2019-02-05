FROM php:7.0.29-apache
MAINTAINER Occitech <contact@occitech.fr>
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libicu-dev
RUN apt-get install -y libmcrypt4 libmcrypt-dev
RUN apt-get install -y libpng12-dev libjpeg-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libxslt-dev
RUN apt-get install -y mysql-client
RUN apt-get install -y unzip
RUN apt-get install -y zlib1g-dev
RUN docker-php-ext-install calendar
RUN docker-php-ext-install intl
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install soap
RUN docker-php-ext-install xsl
RUN docker-php-ext-install zip
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/lib
RUN docker-php-ext-install gd
RUN rm -rf /var/lib/apt/lists/*
RUN yes | pecl install xdebug
RUN echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini
RUN echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini
RUN echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini
RUN echo "xdebug.max_nesting_level=500" >> /usr/local/etc/php/conf.d/xdebug.ini
RUN curl -k -o /usr/local/bin/n98-magerun2 https://files.magerun.net/n98-magerun2-1.6.0.phar
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -q -L https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 -o /usr/local/bin/mhsendmail
RUN chmod +x /usr/local/bin/n98-magerun2
RUN chmod +x /usr/local/bin/mhsendmail
RUN sed -i "s/\/var\/www\/html/\/var\/www\/pub/g" /etc/apache2/sites-enabled/000-default.conf
RUN a2enmod rewrite
COPY php.ini /usr/local/etc/php/
WORKDIR /var/www
