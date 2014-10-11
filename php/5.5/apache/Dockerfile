FROM occitech/apache:2.4

MAINTAINER occitech <contact@occitech.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu utopic universe main multiverse restricted" > /etc/apt/sources.list && echo "deb http://security.ubuntu.com/ubuntu/ utopic-security universe main multiverse restricted" >> /etc/apt/sources.list && apt-get update

RUN apt-get -y install php5 php5-mysql php5-gd php5-mcrypt php5-curl libapache2-mod-php5
RUN php5enmod mcrypt

RUN apt-get -y install php5-xdebug
RUN echo "xdebug.remote_enable=on" >> /etc/php5/mods-available/20-xdebug.ini && echo "xdebug.remote_connect_back=1" >> /etc/php5/mods-available/20-xdebug.ini && echo "xdebug.remote_port=9010" >> /etc/php5/mods-available/20-xdebug.ini

VOLUME ["/etc/php5/"]

RUN apt-get clean

ADD ./init.sh /init.sh
ENTRYPOINT ["/init.sh"]

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
