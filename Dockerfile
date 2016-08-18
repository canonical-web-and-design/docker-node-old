FROM node:4-slim

WORKDIR /app
ENTRYPOINT ["/entrypoint"]

ADD bin /bin/
ADD entrypoint /entrypoint
