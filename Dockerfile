FROM alpine:3.16.2

MAINTAINER Angel Cancio <angel.cancio@gmail.com>

RUN set -ex; \
    apk update && apk add --no-cache curl gcompat zip unzip groff build-base py3-pip libffi-dev cmake &&  \
    curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && ./aws/install

#Install kubectl
RUN curl --silent -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && apk --no-cache del curl \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

