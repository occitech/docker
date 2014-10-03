FROM chadrien/apache24
MAINTAINER chadrien <chadrien@chadrien.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu utopic universe main multiverse restricted" > /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu/ utopic-security universe main multiverse restricted" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get -y install php5 php5-mysql php5-gd php5-mcrypt php5-curl libapache2-mod-php5

RUN rm /etc/php5/apache2/php.ini
RUN rm /etc/php5/cli/php.ini
ADD ./php.ini /etc/php5/apache2/php.ini
ADD ./php.ini /etc/php5/cli/php.ini

RUN apt-get -y install php5-xdebug
RUN echo "xdebug.remote_enable=on" >> /etc/php5/mods-available/xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /etc/php5/mods-available/xdebug.ini
RUN echo "xdebug.remote_port=9010" >> /etc/php5/mods-available/xdebug.ini

RUN apt-get -y install ruby ruby-dev build-essential libsqlite3-dev
RUN gem install mailcatcher

EXPOSE 80 1080

ADD ./init.sh /init.sh
RUN chmod +x /init.sh
ENTRYPOINT ["/init.sh"]

CMD ["/usr/bin/supervisord"]
