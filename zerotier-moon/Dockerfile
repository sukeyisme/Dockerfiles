FROM sukeyisme/zerotier-one:1.2.12

RUN ln -sf /usr/sbin/zerotier-one /zerotier-idtool
RUN cp /usr/sbin/zerotier-one /
COPY startup.sh /startup.sh
RUN chmod 777 /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
