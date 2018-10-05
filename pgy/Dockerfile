FROM xiaobe/pgy_vpn
RUN rm /root/start.sh
COPY start.sh /root/
RUN chmod 777 /root/start.sh
ENTRYPOINT ["/root/start.sh"]
