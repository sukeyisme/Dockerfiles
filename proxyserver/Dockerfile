FROM sukeyisme/python3 as build



FROM sukeyisme/python3

ARG SSPANEL_UIM_RELEASE
ENV SSPANEL_UIM_PATH="/app/sspanel-uim"

# https://github.com/docker-library/php/issues/240
RUN apk add gnu-libiconv=1.15-r3 --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.13/community/ --allow-untrusted
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so

RUN apk add --no-cache tar \
    && echo "**** set version tag ****" \
    && if [ -z ${SSPANEL_UIM_RELEASE+x} ]; then \
           SSPANEL_UIM_RELEASE=$(curl -s https://api.github.com/repos/sukeyisme/sspanel-uim/releases/latest \
           | awk -F\" '/tag_name/ {print $4;exit}'); \
    fi \
    && echo '**** Downloading sspanel-uim version ****' ${SSPANEL_UIM_RELEASE} && \
    curl -sSL -o /app/sspanel-uim.tar.gz https://github.com/sukeyisme/sspanel-uim/archive/${SSPANEL_UIM_RELEASE}.tar.gz && \
    echo '**** Setup ssrpanel ****' && \
    mkdir -p "${SSPANEL_UIM_PATH}" && \
    tar xf /app/sspanel-uim.tar.gz -C \
		"${SSPANEL_UIM_PATH}" --strip-components=1 &&\
    cd ${SSPANEL_UIM_PATH} && \
    curl -SL https://getcomposer.org/installer -o composer-setup.php &&\
    php composer-setup.php && \
    php composer.phar install && \
    echo '**** Set cron job ****' && \
    crontab -l | { cat; echo "30 22 * * * php ${SSPANEL_UIM_PATH}/xcat Job SendMail"; } | crontab - && \
    crontab -l | { cat; echo "0 0 * * * php ${SSPANEL_UIM_PATH}/xcat Job DailyJob"; } | crontab - && \
    crontab -l | { cat; echo "*/1 * * * * php ${SSPANEL_UIM_PATH}/xcat Job CheckJob"; } | crontab - && \
    echo '**** cleanup ****' && \
    rm /app/sspanel-uim.tar.gz && \
    rm -rf /var/cache/apk/*

COPY root/ /

WORKDIR ${SSPANEL_UIM_PATH}

EXPOSE 80

VOLUME /config /clients /storage