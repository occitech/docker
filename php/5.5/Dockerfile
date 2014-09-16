FROM chadrien/apache24
MAINTAINER chadrien <chadrien@chadrien.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu utopic universe main multiverse restricted" > /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu/ utopic-security universe main multiverse restricted" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get -y install php5 php5-mysql php5-gd php5-mcrypt php5-curl libapache2-mod-php5
