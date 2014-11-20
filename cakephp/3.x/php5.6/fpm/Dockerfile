FROM php:5.6-fpm
MAINTAINER occitech <contact@occitech.fr>

RUN requirements="libmcrypt-dev g++ libicu-dev" \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install intl \
    && requirementsToRemove="g++" \
    && apt-get purge --auto-remove -y $requirementsToRemove

RUN sed -i -e 's/listen.*/listen = 0.0.0.0:9000/' /usr/local/etc/php-fpm.conf \
    && echo 'env[DB_ENV_MYSQL_ROOT_PASSWORD] = $DB_ENV_MYSQL_ROOT_PASSWORD' >> /usr/local/etc/php-fpm.conf \
    && echo 'env[DB_ENV_MYSQL_DATABASE] = $DB_ENV_MYSQL_DATABASE' >> /usr/local/etc/php-fpm.conf

RUN usermod -u 1000 www-data
