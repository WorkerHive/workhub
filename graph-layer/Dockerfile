FROM node:14

ARG domain
ARG WEBUI_VERSION

ENV WORKHUB_DOMAIN $domain

RUN apt-get install -y wget git python3 

#RUN apk add libc6-compat
#RUN ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2

COPY --from=hairyhenderson/gomplate:v3.8.0 /gomplate /bin/gomplate

#RUN apt-get install -y gomplate 
WORKDIR /graph

RUN git clone https://github.com/WorkerHive/hub workhub


WORKDIR /graph/workhub

ADD greenlock.config.json greenlock.template

ADD wait-for-it.sh .

RUN git pull

RUN npm install

RUN npx lerna bootstrap --scope workhub-server --include-dependencies

ADD run.sh .

CMD ./wait-for-it.sh rabbit1:5672 -- ./run.sh

