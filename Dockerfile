FROM golang:1.13-alpine AS build-env

# install build tools
RUN apk add --no-cache \
    git \
    build-base \
    libc6-compat \
    ca-certificates \
    tini

RUN go get -u -v \
    github.com/oxequa/realize

WORKDIR /go/src
COPY . .
RUN go build -o server main.go

EXPOSE 1323
ENTRYPOINT ["/sbin/tini", "--"]