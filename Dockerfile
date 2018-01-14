FROM alpine:3.7

RUN apk add -U \
    git \
    nodejs \
    nodejs-npm \
 && rm -rf /var/cache/apk/* \
 && npm install -g truffle \
 && npm install -g ganache-cli
VOLUME /var/nop
WORKDIR /var/nop
