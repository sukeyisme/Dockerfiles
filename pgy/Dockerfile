FROM xiaobe/pgy_vpn
RUN rm /root/start.sh
COPY start.sh /root/
RUN chmod 777 /root/start.sh
ENV VPNID 0
ENV PASSWORD 0
CMD /root/start.sh $VPNID $PASSWORD && top -b
