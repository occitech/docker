FROM debian:stretch

MAINTAINER occitech <contact@occitech.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)

RUN apt-get install -y --no-install-recommends \
    ncftp \
    pwgen \
    duply \
    python-swiftclient \
    sshfs \
    fuse \
    mysql-client

ENTRYPOINT ["/usr/bin/duply"]
CMD ["usage"]
