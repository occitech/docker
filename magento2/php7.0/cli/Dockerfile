FROM php:7.0-cli

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update \
  && docker-php-ext-install mbstring \
  && docker-php-ext-install pdo_mysql \
  && apt-get install -y libxml2-dev \
      && docker-php-ext-install soap \
  && apt-get install -y libmcrypt4 libmcrypt-dev \
      && docker-php-ext-install mcrypt \
  && apt-get install -y libxslt-dev \
      && docker-php-ext-install xsl \
  && apt-get install -y libicu-dev \
      && docker-php-ext-install intl \
  && apt-get install -y libpng-dev libjpeg-dev \
      && docker-php-ext-configure gd --with-jpeg-dir=/usr/lib \
      && docker-php-ext-install gd \
  && apt-get install -y zlib1g-dev \
      && docker-php-ext-install zip \
  && rm -rf /var/lib/apt/lists/*

COPY php.ini /usr/local/etc/php/

VOLUME /magento
WORKDIR /magento
