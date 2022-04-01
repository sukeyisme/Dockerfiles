FROM lsiobase/ubuntu:jammy

RUN apt update \
    &&apt install -y --no-install-recommends \
    libpcap0.8 \
    libuv1 \
    ca-certificates \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false

ENV VERSION=0.2.3

ADD https://github.com/spacemeowx2/switch-lan-play/releases/download/v$VERSION/lan-play-linux /usr/bin/lan-play-linux
RUN  chmod +x /usr/bin/lan-play-linux

COPY root/ /