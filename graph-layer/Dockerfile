FROM node:15.4.0-alpine3.11

RUN apk add git python3 py3-pip alpine-sdk 

RUN apk add gomplate 
WORKDIR /graph

ADD greenlock.config.json greenlock.template
RUN WORKHUB_DOMAIN=$domain gomplate -f greenlock.template -o greenlock.d/config.json

RUN git clone https://github.com/WorkerHive/workhub-graph

WORKDIR /graph/workhub-graph

ADD wait-for-it.sh .

RUN git pull

RUN yarn install

RUN apk add bash wget

WORKDIR /graph/workhub-graph/workhub-web

RUN wget https://github.com/WorkerHive/React-WorkerHub/releases/download/v0.0.3/build.tar

RUN tar -xvf build.tar

WORKDIR /graph/workhub-graph

ADD run.sh .

CMD ./wait-for-it.sh rabbit1:5672 -- ./run.sh

