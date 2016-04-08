FROM golang:1.6-alpine

RUN apk add --no-cache --update git bzr
RUN go get github.com/mailhog/MailHog

EXPOSE 1025 8025

ENTRYPOINT ["/go/bin/MailHog"]