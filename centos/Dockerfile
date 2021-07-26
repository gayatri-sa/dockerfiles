FROM gayatrisa/mycentos:base7
MAINTAINER Gayatri S Ajith <gayatri@schogini.com>

# USED TO BUILD gayatrisa/mycentos:7-ssh-no-supervisord

RUN yum update -y && yum install -y openssh-server openssh-clients nano curl git tree wget sudo
RUN yum install -y epel-release && \
    yum install -y \
      iproute \
      python-setuptools \
      hostname \
      inotify-tools \
      yum-utils \
      which \
      jq

RUN sed -ri 's/%sudo\s+.*/#&/' /etc/sudoers && \
    echo '%sudo ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    sed -ri 's/%wheel\s+.*/#&/' /etc/sudoers && \
    echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' \
&& ssh-keygen -t dsa  -f /etc/ssh/ssh_host_dsa_key -N '' \
&& ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' \
&& chmod 600 /etc/ssh/*

RUN \
  sed -ri 's/^HostKey\ \/etc\/ssh\/ssh_host_ed25519_key/#HostKey\ \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config && \
  sed -ri 's/^#HostKey\ \/etc\/ssh\/ssh_host_dsa_key/HostKey\ \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config && \
  sed -ri 's/^#HostKey\ \/etc\/ssh\/ssh_host_rsa_key/HostKey\ \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config && \
  sed -ri 's/^#HostKey\ \/etc\/ssh\/ssh_host_ecdsa_key/HostKey\ \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config && \
  sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

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

# - Clean YUM caches to minimise Docker image size...
RUN yum clean all && rm -rf /tmp/yum*

RUN useradd --create-home --shell /bin/bash centos
RUN echo 'centos:aspe1234' | chpasswd
RUN usermod -aG wheel centos

COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
