FROM alpine/git:latest as clone

LABEL maintainer="Ztj <ztj1993@gmail.com>"

RUN git clone --branch 0.5 https://github.com/Rarst/release-belt.git /srv

FROM composer:latest as install

COPY --from=clone /srv /srv
