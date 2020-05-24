FROM alpine:3.11.6

LABEL maintainer="Ztj <ztj1993@gmail.com>"

WORKDIR /srv

RUN apk add --no-cache git nodejs npm yarn

RUN git clone https://github.com/ztj-archived/uni-app-dev.git . && yarn install

EXPOSE 80

CMD ["yarn", "serve"]
