FROM golang:1.8-alpine

RUN apk add --no-cache --update git

RUN go get github.com/patrickmn/ocp

ENTRYPOINT ["/go/bin/ocp"]
