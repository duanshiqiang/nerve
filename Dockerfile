FROM ruby:alpine

LABEL maintainer="duanshiqiang1@gmail.com"

RUN apk update && apk add git make gcc ruby-dev build-base \
    && git clone -b visenze --single-branch https://github.com/duanshiqiang/nerve.git /tmp/nerve \
    && (cd /tmp/nerve; gem build nerve.gemspec && gem install --no-document --without development test nerve-0.8.1.gem) \
    && apk del git make gcc ruby-dev build-base && rm -rf /tmp/nerve

ENTRYPOINT ["/usr/local/bundle/bin/nerve"]
