FROM node:15.4.0-alpine3.10
# replace this with your application's default port
RUN npm i -g y-leveldb
RUN npm i -g y-websockets-server

EXPOSE 1234

CMD ["y-websockets-server", "--port", "1234", "--db", "leveldb"]
