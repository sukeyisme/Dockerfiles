FROM sukeyisme/zerotier-one

RUN ln -sf /usr/sbin/zerotier-one /zerotier-idtool
COPY startup.sh /startup.sh
RUN chmod 777 /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
