FROM node:6-slim

WORKDIR /app
ENTRYPOINT ["/entrypoint"]

ADD bin /bin/
ADD entrypoint /entrypoint
