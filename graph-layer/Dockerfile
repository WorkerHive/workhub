FROM node:14.0.0-alpine3.10

ARG domain
ENV WORKHUB_DOMAIN $domain

RUN apk add git python3 py3-pip alpine-sdk 

RUN apk add libc6-compat
RUN ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2

RUN apk add gomplate 
WORKDIR /graph

RUN git clone https://github.com/WorkerHive/workhub-graph



WORKDIR /graph/workhub-graph

ADD greenlock.config.json greenlock.template

ADD wait-for-it.sh .

RUN git pull

RUN yarn install

RUN apk add bash wget

WORKDIR /graph/workhub-graph/workhub-web/build

ADD build/ .

WORKDIR /graph/workhub-graph

ADD run.sh .

CMD ./wait-for-it.sh rabbit1:5672 -- ./run.sh

