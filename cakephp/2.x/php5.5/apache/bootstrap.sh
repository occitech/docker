#!/usr/bin/env bash

sed -i -e "s/DocumentRoot .*/DocumentRoot ${CAKEPHP_WEBROOT//\//\\\/}/" -e "s/<Directory .*>/<Directory ${CAKEPHP_WEBROOT//\//\\\/}>/" /etc/apache2/sites-available/000-default.conf

exec "$@"
