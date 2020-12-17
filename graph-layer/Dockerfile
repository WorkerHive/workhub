FROM node:15.4.0-alpine3.11

RUN apk add git python3 py3-pip alpine-sdk 

RUN apk add gomplate 
WORKDIR /graph

RUN git clone https://github.com/WorkerHive/workhub-graph

WORKDIR /graph/workhub-graph/greenlock.d 

ADD greenlock.config.json greenlock.template
RUN WORKHUB_DOMAIN=$domain gomplate -f greenlock.template -o config.json

WORKDIR /graph/workhub-graph

ADD wait-for-it.sh .

RUN git pull

RUN yarn install

RUN apk add bash wget

WORKDIR /graph/workhub-graph/workhub-web

ADD build.tar build.tar

RUN tar -xvf build.tar

WORKDIR /graph/workhub-graph

ADD run.sh .

CMD ./wait-for-it.sh rabbit1:5672 -- ./run.sh

