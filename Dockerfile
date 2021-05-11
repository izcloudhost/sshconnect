FROM       ubuntu:latest

MAINTAINER InterZONE Web Services "https://interzone.host" InterZONE EVCS "https://izcloud.host"
MAINTAINER InrerZONE Storage & Service MX  LTD  /  InterZONE Web Service Madrid LTD 
MAINTAINER GUADALAJARA MX "gdl@interzone.host" MTY "mty@interzone.host" ES "madrid@interzone.host"

RUN apt-get update && apt-get upgrade -y

RUN apt-get install sudo -y
RUN apt-get install nano -y
RUN apt-get install net-tools -y
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22 80 8000-8100 2000-2100 3000-3100 5000-5100 6000-6100 7000-7100 9000-9100

CMD    ["/usr/sbin/sshd", "-D"]
