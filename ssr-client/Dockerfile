FROM alpine

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 2333
ENV PASSWORD    2333
ENV METHOD      aes-128-ctr
ENV PROTOCOL    auth_aes128_md5
ENV OBFS        tls1.2_ticket_auth
ENV LOCAL_ADDR  127.0.0.1
ENV LOCAL_PORT  8992
ENV PROTOCOL_PARAM ""
ENV OBFS_PARAM ""


RUN apk add --no-cache --update python libsodium privoxy

ADD shadowsocksr/shadowsocks /shadowsocks

WORKDIR /shadowsocks
CMD privoxy /etc/privoxy/config && \
python local.py -s "$SERVER_ADDR" \
-p "$SERVER_PORT" \
-k "$PASSWORD" \
-m "$METHOD" \
-o "$OBFS" \
-O "$PROTOCOL" \
-l "$LOCAL_PORT" \
-b "$LOCAL_ADDR" \
-G "$PROTOCOL_PARAM" \
-g "$OBFS_PARAM"
