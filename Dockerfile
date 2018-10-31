FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN set -x \
 && apt-get update \
 && apt-get install -y openssh-server rsync \
 && rm -rf /var/lib/apt/lists/*

RUN set -x \
 && mkdir /var/run/sshd \
 && rm -f /etc/ssh/ssh_host*

EXPOSE 22

CMD ["/usr/sbin/sshd", "-e", "-D"]
