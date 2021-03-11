FROM node:14

ARG domain

ENV WORKHUB_DOMAIN $domain

RUN apt-get install python3 -y
#RUN apk add bash python3 alpine-sdk
#RUN apk add libc6-compat
#RUN ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2

#RUN apt-get install -y gomplate 
WORKDIR /graph

RUN npm i --global --unsafe-perm @workerhive/server@2.1.28

ADD wait-for-it.sh .

ADD run.sh .

CMD ./wait-for-it.sh rabbit1:5672 -- ./run.sh

