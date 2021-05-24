FROM gayatrisa/myubuntu:20.04-with-ssh
MAINTAINER Gayatri S Ajith <gayatri.sa@gmail.com>

RUN apt-get update && apt-get install -y nano curl wget git tree
RUN wget https://apt.puppetlabs.com/puppet7-release-focal.deb && dpkg -i puppet7-release-focal.deb
RUN apt-get update -y && apt-get install -y puppetserver
RUN sed -ri 's/\-Xms2g/\-Xms1g/' /etc/default/puppetserver && \
    sed -ri 's/\-Xmx2g/\-Xmx1g/' /etc/default/puppetserver

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN echo "export PATH=/opt/puppetlabs/bin:${PATH}" >> /root/.bashrc

RUN wget https://apt.puppet.com/puppet-tools-release-focal.deb && dpkg -i puppet-tools-release-focal.deb
RUN apt-get update -y && apt-get install -y pdk

