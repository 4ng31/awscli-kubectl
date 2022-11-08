FROM alpine:latest

MAINTAINER Angel Cancio <angel.cancio@gmail.com>

RUN apk --no-cache add curl \
    && apk add --no-cache aws-cli

#Install kubectl
RUN curl --silent -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && apk --no-cache del curl \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*
