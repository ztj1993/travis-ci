FROM alpine:3.11.6

LABEL maintainer="Ztj <ztj1993@gmail.com>"

WORKDIR /srv

RUN pwd

VOLUME /srv
EXPOSE 8080

CMD ["yarn", "serve"]
