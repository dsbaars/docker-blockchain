FROM alpine:3.4
MAINTAINER dsbaars

RUN apk add --update go git make gcc musl-dev gmp-dev gmp
RUN git clone https://github.com/ethereum/go-ethereum /tmp/geth
RUN (cd /tmp/geth && make geth)
RUN cp /tmp/geth/build/bin/geth /usr/local/bin/geth
RUN apk del go git make gcc musl-dev gmp-dev
RUN rm -rf /tmp/geth/ && rm -rf /var/cache/apk/*

ENV GOSU_VERSION 1.9
RUN set -x \
    && apk add --no-cache --virtual .gosu-deps \
        dpkg \
        gnupg \
        openssl \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64.asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && apk del .gosu-deps

EXPOSE 8545
EXPOSE 30303

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN adduser -S geth
ENV GETH_USER geth

ENTRYPOINT ["/entrypoint.sh"]
