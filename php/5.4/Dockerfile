FROM chadrien/apache22
MAINTAINER chadrien <chadrien@chadrien.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://old-releases.ubuntu.com/ubuntu raring universe main multiverse restricted" > /etc/apt/sources.list
RUN echo "deb http://old-releases.ubuntu.com/ubuntu/ raring-security universe main multiverse restricted" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install php5 php5-mysql php5-gd php5-mcrypt php5-curl libapache2-mod-php5 sendmail php5-xdebug
RUN rm /etc/php5/conf.d/20-xdebug.ini
ADD ./ext-xdebug.ini /etc/php5/conf.d/20-xdebug.ini

EXPOSE 80
