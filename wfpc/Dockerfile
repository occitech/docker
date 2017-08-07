FROM php:7.1-alpine

RUN apk add --update git

RUN git clone https://github.com/quickshiftin/wfpc.git /usr/local/wfpc

WORKDIR /usr/local/wfpc

ENTRYPOINT ["php", "-f", "wfpc", "--"]
