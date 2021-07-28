FROM gayatrisa/myubuntu:20.04-with-ssh
MAINTAINER Gayatri S Ajith <gayatri.sa@gmail.com>

RUN apt-get update && apt-get install -y ansible sshpass iputils-ping dnsutils python3-pip
RUN ssh-keygen -t rsa -q -N '' -f ~/.ssh/id_rsa

RUN echo 'host_key_checking = False' >> /etc/ansible/ansible.cfg
