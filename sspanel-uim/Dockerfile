FROM linuxserver/nginx as build



FROM linuxserver/nginx

ARG SSPANEL_UIM_RELEASE
ENV SSPANEL_UIM_PATH="/app/sspanel-uim"

ENV LANG=en_US.UTF-8 \
LANGUAGE=en_US.UTF-8

RUN apk add --no-cache tar ca-certificates \
    && echo "**** set language ****" \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \ 
    && wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk \ 
    && wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-bin-2.29-r0.apk \
    && wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-i18n-2.29-r0.apk \
    && apk add glibc-2.29-r0.apk glibc-bin-2.29-r0.apk glibc-i18n-2.29-r0.apk \
    && rm -rf /usr/lib/jvm glibc-2.29-r0.apk glibc-bin-2.29-r0.apk  glibc-i18n-2.29-r0.apk \
    && /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 "$LANG" || true \
    && echo "export LANG=$LANG" > /etc/profile.d/locale.sh \
    && apk del glibc-i18n \
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
    cp config/.config.example.php config/.config.php && \
    cp config/appprofile.example.php config/appprofile.php && \
    chmod -R 755 ${SSPANEL_UIM_PATH}/storage &&\
    chmod -R 777 ${SSPANEL_UIM_PATH}/storage/framework/smarty/compile/ &&\
    curl -SL https://getcomposer.org/installer -o composer-setup.php &&\
    php composer-setup.php && \
    php composer.phar install && \
    php xcat initQQWry && \
    php xcat ClientDownload && \
    echo '**** Set cron job ****' && \
    crontab -l | { cat; echo "30 22 * * * php ${SSPANEL_UIM_PATH}/xcat sendDiaryMail"; } | crontab - && \
    crontab -l | { cat; echo "0 0 * * * php ${SSPANEL_UIM_PATH}/xcat Job DailyJob"; } | crontab - && \
    crontab -l | { cat; echo "*/1 * * * * php ${SSPANEL_UIM_PATH}/xcat Job CheckJob"; } | crontab - && \
    echo '**** cleanup ****' && \
    rm /app/sspanel-uim.tar.gz && \
    rm -rf ${SSPANEL_UIM_PATH}/config &&\
    rm -rf /var/cache/apk/*

COPY root/ /

WORKDIR ${SSPANEL_UIM_PATH}

EXPOSE 80

VOLUME /config 