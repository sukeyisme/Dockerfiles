FROM centos

RUN yum install wget -y && touch test
RUN wget http://download.oray.com/pgy/linux/pgyvpn-2.1.0-amd64.rpm \
    && rpm -ivh pgyvpn-2.1.0-amd64.rpm

COPY start.sh /root/
RUN chmod 777 start.sh

CMD ["/bin/sh" ,"cd /root && ./start.sh && top -b"]
