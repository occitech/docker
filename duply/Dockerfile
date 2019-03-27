FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)

RUN apt-get install -y --no-install-recommends \
    ncftp \
    pwgen \
    duply \
    python-swiftclient \
    sshfs \
    fuse \
    default-mysql-client

ENTRYPOINT ["/usr/bin/duply"]
CMD ["usage"]
