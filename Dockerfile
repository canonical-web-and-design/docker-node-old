FROM node:6-slim

WORKDIR /app
ENTRYPOINT ["/entrypoint"]

ENV APP_MODULES="/packages/node_modules"
ENV OVERRIDES="/packages/overrides"
ENV NODE_PATH="${OVERRIDES}:${APP_MODULES}"
ENV SASS_PATH="${NODE_PATH}"
ENV PATH="${OVERRIDES}/.bin:${APP_MODULES}/.bin:/bin:${PATH}"

RUN mkdir -p /packages/node_modules
RUN ln -s /app/package.json /packages/package.json

ADD bin /bin/
ADD entrypoint /entrypoint
