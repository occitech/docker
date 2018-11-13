FROM php:5.6-cli

RUN docker-php-ext-install mbstring

ADD http://codeception.com/codecept.phar /usr/local/bin/codecept
RUN chmod +x /usr/local/bin/codecept

COPY php.ini /usr/local/etc/php/

WORKDIR /tests

ENTRYPOINT ["codecept"]
CMD ["--help"]
