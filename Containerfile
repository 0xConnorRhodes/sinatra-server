FROM alpine:latest

RUN apk upgrade

RUN apk add --no-cache \
    ruby \
    ruby-dev \
    make \
    gcc \
    libc-dev

RUN gem update --system

RUN gem install \
    sinatra \
    rackup \
    puma \
    pry \
    mustache

RUN apk del gcc libc-dev

CMD ["ruby", "/app/server.rb"]