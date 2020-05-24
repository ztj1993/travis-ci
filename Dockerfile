FROM alpine:3.11.6

LABEL maintainer="Ztj <ztj1993@gmail.com>"

WORKDIR /srv
EXPOSE 8080

RUN apk add --no-cache git nodejs npm yarn

RUN echo "********************" \
  && git clone https://github.com/ztj-archived/uni-app-dev.git . \
  && yarn install \
  && yarn add node-sass --dev

RUN echo "********************" \
  && rm -rf ./src \
  && git clone https://github.com/ztj-archived/uni-app-dev.git ./src

CMD ["yarn", "serve"]
