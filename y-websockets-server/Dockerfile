FROM node:15.4.0-alpine3.10
# replace this with your application's default port
RUN npm i -g y-leveldb y-websocket yjs

EXPOSE 1234

ENV YPERSISTENCE "/data/ydir"
CMD ["/usr/local/bin/y-websocket-server"]
