FROM alpine:3.11.6

LABEL maintainer="Ztj <ztj1993@gmail.com>"

WORKDIR /srv
VOLUME /srv
EXPOSE 8080

RUN echo "********************" \
  && pwd
  && echo "--------------------" \
  && apk add --no-cache git nodejs npm yarn \
  && echo "--------------------" \
  && git clone https://github.com/ztj-archived/uni-app-dev.git . \
  && ls \
  && yarn install \
  && yarn add node-sass --dev \
  && echo "--------------------"

CMD ["yarn", "serve"]
