FROM python:3.5-alpine3.8

LABEL maintainer="Ztj <ztj1993@gmail.com>"

ENV ROOT_PASSWORD="123456"

RUN pip install --upgrade pip \
  && echo "---------- apk install ----------" \
  && apk update \
  && apk add git openssh-server \
  && rm -rf /var/cache/apk/* \
  && echo "---------- sshd ----------" \
  && ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key \
  && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key \
  && sed -i "s@^#PermitRootLogin.*@PermitRootLogin yes@" /etc/ssh/sshd_config \
  && sed -i "s@^PermitRootLogin.*@PermitRootLogin yes@" /etc/ssh/sshd_config \
  && sed -i "s@^PasswordAuthentication.*@PasswordAuthentication yes@" /etc/ssh/sshd_config \
  && echo "root:${ROOT_PASSWORD}" | chpasswd \
  && echo "---------- aliyun mirror ----------" \
  && echo "http://mirrors.aliyun.com/alpine/v3.8/main" >> /etc/apk/repositories \
  && echo "http://mirrors.aliyun.com/alpine/v3.8/community" >> /etc/apk/repositories
