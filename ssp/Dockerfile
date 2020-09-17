FROM linuxserver/nginx

ARG SSP_RELEASE
ENV SSP_PATH="/config/www/ssp"


RUN echo "**** set version tag ****" && \
    if [ -z ${SSP_RELEASE+x} ]; then \
           SSP_RELEASE=$(curl -s https://api.github.com/repos/ltb-project/self-service-password/releases/latest \
           | awk -F\" '/tag_name/ {print $4;exit}'); \
    fi && \
    echo '**** Downloading Self Service Password version ****' ${SSP_RELEASE} && \
    curl -sSL -o /app/ssp.tar.gz https://github.com/ltb-project/self-service-password/archive/${SSP_RELEASE}.tar.gz && \
    echo '**** cleanup ****' && \
    rm -rf /var/cache/apk/*

COPY root/ /

EXPOSE 80

VOLUME /config 