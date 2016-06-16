FROM ubuntu:16.04

RUN set -x && \
    apt-get --quiet --yes update && \
    apt-get --quiet --yes install openssh-server && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN set -x && \
    groupadd --gid 2200 sftpaccess && \
    useradd --uid 2201 --gid 2200 --create-home -p '*' --shell /usr/sbin/nologin arq && \
    useradd --uid 2202 --gid 2200 --create-home -p '*' --shell /usr/sbin/nologin lgg4
USER root

RUN mkdir /var/run/sshd && \
    chmod 0755 /var/run/sshd && \
    touch /etc/ssh/sshd_not_to_be_run && \
    rm -f /etc/ssh/ssh_host* && \
    mkdir /etc/ssh/authorized_keys

ENV SHR_EXEC_KEEP_CAPS ALL
ENV SHR_EXEC_USER root

EXPOSE 22

COPY sshd_config /etc/ssh/sshd_config
COPY bin/boot /usr/local/bin/sshd_boot

CMD /usr/local/bin/sshd_boot
