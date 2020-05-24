FROM alpine:3.11.6

LABEL maintainer="Ztj <ztj1993@gmail.com>"

WORKDIR /srv
VOLUME /srv
EXPOSE 8080

RUN echo pwd
#
#RUN echo "********** start **********" \
##  && echo "---------- aliyun mirror ----------" \
##  && echo "http://mirrors.aliyun.com/alpine/v3.11/main" > /etc/apk/repositories \
##  && echo "http://mirrors.aliyun.com/alpine/v3.11/community" >> /etc/apk/repositories \
#  && echo "---------- apk install ----------" \
#  && apk update \
#  && apk add git nodejs npm yarn \
#  && rm -rf /var/cache/apk/* \
##  && echo "---------- yarn ----------" \
##  && yarn config -g set registry https://registry.npm.taobao.org \
##  && yarn config -g set sass_binary_site https://cdn.npm.taobao.org/dist/node-sass \
#  && echo "---------- cli ----------" \
#  && git clone https://github.com/ztj-archived/uni-app-dev.git \
#  && yarn install \
#  && yarn add node-sass --dev \
#  && echo "********** end **********"
#
#CMD ["yarn", "serve"]
