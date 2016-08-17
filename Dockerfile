FROM node:4-slim

WORKDIR /app
ENTRYPOINT ["/entrypoint"]

RUN npm install -g gulp

ADD bin /bin/
ADD entrypoint /entrypoint
