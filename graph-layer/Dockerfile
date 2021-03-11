FROM node:14-alpine

ARG domain

ENV WORKHUB_DOMAIN $domain

RUN apk add bash
#RUN apk add libc6-compat
#RUN ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2

#RUN apt-get install -y gomplate 
WORKDIR /graph

RUN npm i --global --unsafe-perm @workerhive/server@2.1.20

ADD wait-for-it.sh .

ADD run.sh .

CMD ./wait-for-it.sh rabbit1:5672 -- ./run.sh

