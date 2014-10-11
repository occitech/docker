FROM occitech/php:5.4-apache

MAINTAINER occitech <contact@occitech.fr>

RUN apt-get -y install php5-mysql php5-gd php5-mcrypt php5-curl
RUN apt-get -y install curl && curl -o /usr/bin/n98-magerun https://raw.githubusercontent.com/netz98/n98-magerun/1.91.0/n98-magerun.phar && chmod +x /usr/bin/n98-magerun
RUN apt-get clean

ADD ./default.conf /etc/apache2/sites-available/default

ADD ./bin/set-base-url /usr/local/bin/set-base-url
