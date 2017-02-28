FROM node:7-slim

RUN cd /opt && wget https://github.com/yarnpkg/yarn/releases/download/v0.19.1/yarn-v0.19.1.tar.gz && tar -xzf yarn-v0.19.1.tar.gz
RUN ln -s /opt/dist/bin/yarn /usr/local/bin/yarn
RUN mkdir /overrides

WORKDIR /app
ENTRYPOINT ["/entrypoint"]

ENV HASH_FILE="/package.json.hash"

ADD USAGE.md /USAGE.md
ADD entrypoint /entrypoint

