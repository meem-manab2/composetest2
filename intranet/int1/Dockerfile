FROM ubuntu:22.04
RUN apt-get update && apt-get install -y net-tools iputils-ping traceroute iproute2 tcpdump  nmap openssh-server net-tools iputils-ping traceroute vim nano iproute2 iptables pkg-config ufw
RUN mkdir /var/run/sshd
RUN echo "root:root" |chpasswd
RUN sed -ri "s/^#?PermitRootLogin\s+.*/PermitRootLogin yes/" /etc/ssh/sshd_config
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 22
COPY ./start.sh .
RUN chmod +x start.sh
CMD ["./start.sh"]