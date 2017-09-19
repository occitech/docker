FROM debian:stretch

MAINTAINER occitech <contact@occitech.fr>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ncftp \
    pwgen \
    duply \
    python-swiftclient \
    sshfs \
    fuse \
    mysql-client

ENTRYPOINT ["/usr/bin/duply"]
CMD ["usage"]
