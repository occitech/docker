#!/bin/bash

for env_var in $(env | sed -ne "s/\([^=]*\)=.*/\1/p" | uniq); do
    echo "env[${env_var}] = \$${env_var}" >> /usr/local/etc/php-fpm.conf;
done

exec "$@"