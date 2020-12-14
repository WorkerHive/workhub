FROM node:15.4.0-alpine3.11

RUN apk add git python3 py3-pip alpine-sdk 

WORKDIR /graph

RUN git clone https://github.com/WorkerHive/workhub-graph

WORKDIR /graph/workhub-graph

ADD wait-for-it.sh .

RUN git pull

RUN yarn install

RUN apk add bash

RUN git clone https://github.com/WorkerHive/React-WorkerHub workhub-web

WORKDIR /graph/workhub-graph/workhub-web

ENV REACT_APP_GRAPH_URL=/graphql

RUN yarn install

RUN yarn build

WORKDIR /graph/workhub-graph

ADD run.sh .

CMD ./wait-for-it.sh rabbit1:5672 -- ./run.sh

