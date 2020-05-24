FROM alpine:3.11.6

LABEL maintainer="Ztj <ztj1993@gmail.com>"

WORKDIR /srv
VOLUME /srv
EXPOSE 8080

RUN echo "********** start **********" \
  && echo "---------- apk install ----------" \
  && apk update \
  && apk add git nodejs npm yarn \
  && rm -rf /var/cache/apk/* \
  && echo "---------- cli ----------" \
  && git clone https://github.com/ztj-archived/uni-app-dev.git \
  && yarn install \
  && yarn add node-sass --dev \
  && echo "---------- yarn ----------" \
  && yarn config -g set registry https://registry.npm.taobao.org \
  && echo "********** end **********"

CMD ["yarn", "serve"]
