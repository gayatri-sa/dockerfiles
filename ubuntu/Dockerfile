FROM ubuntu:20.04
MAINTAINER Gayatri S Ajith <gayatri.sa@gmail.com>

# USED TO BUILD gayatrisa/myubuntu:20.04-ssh-no-supervisord

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
RUN apt-get update && apt-get install -y nano curl wget git tree openssh-server sudo iputils-ping dnsutils && apt-get clean

RUN sed -ri 's/%sudo\s+.*/#&/' /etc/sudoers && \
    echo '%sudo ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN mkdir -p /run/sshd

RUN sed -ri 's/^#IgnoreUserKnownHosts\s+.*/IgnoreUserKnownHosts yes/' /etc/ssh/sshd_config && \
    sed -ri 's/^PermitEmptyPasswords\s+.*/PermitEmptyPasswords yes/' /etc/ssh/sshd_config && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config && \
    sed -ri 's/^#PermitEmptyPasswords\s+.*/PermitEmptyPasswords yes/' /etc/ssh/sshd_config && \
    sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/^#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config && \
    echo "ClientAliveInterval 120" >> /etc/ssh/sshd_config && \
    echo "ClientAliveCountMax 720" >> /etc/ssh/sshd_config && \
    echo "root:sree1234"|chpasswd

RUN useradd --create-home --shell /bin/bash ubuntu
RUN echo 'ubuntu:aspe1234' | chpasswd
RUN usermod -aG sudo ubuntu

COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
