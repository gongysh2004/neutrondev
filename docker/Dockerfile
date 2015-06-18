FROM dockerreg.99cloud.net/ubuntu:15.04
MAINTAINER Yong Sheng Gong  "gong.yongsheng@99cloud.net"
COPY sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y vim git openssh-server net-tools wget sudo && \
    apt-get clean

RUN useradd stack -d /home/stack -m -p $(openssl passwd -1 dev123) -s /bin/bash
RUN echo "stack  ALL=(ALL)       NOPASSWD:ALL" >>/etc/sudoers && \
    mkdir /var/run/sshd
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN echo 'useDNS no' >> /etc/ssh/sshd_config

COPY run.sh /run.sh

VOLUME ["/opt/stack"]
EXPOSE 22

CMD ["/run.sh"]

