FROM occitech/apache:2.2

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe main multiverse restricted" > /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ precise-security universe main multiverse restricted" >> /etc/apt/sources.list && apt-get update

RUN apt-get -y install php5 php5-cli libapache2-mod-php5

RUN apt-get -y install php5-xdebug
RUN echo "xdebug.remote_enable=on" >> /etc/php5/conf.d/20-xdebug.ini && echo "xdebug.remote_connect_back=1" >> /etc/php5/conf.d/20-xdebug.ini && echo "xdebug.remote_port=9010" >> /etc/php5/conf.d/20-xdebug.ini

RUN apt-get clean
