FROM node:15.4.0-alpine3.11

ARG domain
ENV WORKHUB_DOMAIN $domain

RUN apk add git python3 py3-pip alpine-sdk 

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

