FROM alpine/git:latest as clone
LABEL maintainer="Ztj <ztj1993@gmail.com>"
RUN git clone --branch 0.5 https://github.com/Rarst/release-belt.git /srv

FROM composer:latest as install
LABEL maintainer="Ztj <ztj1993@gmail.com>"
COPY --from=clone /srv /srv
WORKDIR /srv
RUN composer belt-update
RUN rm -rf /srv/.git

FROM php:7.3-apache
LABEL maintainer="Ztj <ztj1993@gmail.com>"
COPY --from=install /srv /srv
RUN rm -rf /var/www/html && ln -s /srv/public /var/www/html
WORKDIR /srv/releases
