FROM alpine:3.16.2

MAINTAINER Angel Cancio <angel.cancio@gmail.com>

RUN apk update
RUN apk --no-cache add aws-cli curl jq
RUN curl -sL "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

RUN aws --version
RUN kubectl version --client=true --output=json |jq '.clientVersion.gitVersion'

