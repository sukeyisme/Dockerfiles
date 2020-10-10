FROM linuxserver/nginx as build



FROM linuxserver/nginx

ARG SSPANEL_UIM_RELEASE
ENV SSPANEL_UIM_PATH="/config/www/sspanel-uim"


RUN echo "**** set version tag ****" && \
    if [ -z ${SSPANEL_UIM_RELEASE+x} ]; then \
           SSPANEL_UIM_RELEASE=$(curl -s https://api.github.com/repos/sukeyisme/sspanel-uim/releases/latest \
           | awk -F\" '/tag_name/ {print $4;exit}'); \
    fi && \
    echo '**** Downloading sspanel-uim version ****' ${SSPANEL_UIM_RELEASE} && \
    curl -sSL -o /app/sspanel-uim.tar.gz https://github.com/sukeysime/sspanel-uim/archive/${SSPANEL_UIM_RELEASE}.tar.gz && \
    echo '**** cleanup ****' && \
    rm -rf /var/cache/apk/*

COPY root/ /

EXPOSE 80

VOLUME /config 