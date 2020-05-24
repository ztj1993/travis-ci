FROM alpine:3.11.6

LABEL maintainer="Ztj <ztj1993@gmail.com>"

RUN echo "********************" \
  && cd /srv \
  && echo "--------------------" \
  && apk add --no-cache git nodejs npm yarn \
  && echo "--------------------" \
  && git clone https://github.com/ztj-archived/uni-app-dev.git . \
  && yarn install \
  && yarn add node-sass --dev \
  && echo "--------------------"

WORKDIR /srv
VOLUME /srv
EXPOSE 8080

CMD ["yarn", "serve"]
