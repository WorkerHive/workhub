FROM node:15.4.0-alpine3.11

RUN apk add git python3 py3-pip alpine-sdk 

WORKDIR /graph

RUN git clone https://github.com/WorkerHive/workhub-graph

WORKDIR /graph/workhub-graph

ADD wait-for-it.sh .

RUN yarn install

RUN apk add bash

CMD ./wait-for-it.sh mongo:27017 -- node index.js

