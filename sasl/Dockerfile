FROM lsiobase/alpine:3.12

ENV CYRUS_SASL_VERSION=2.1.27

RUN set -x \
 && mkdir -p /srv/saslauthd.d /tmp/cyrus-sasl /var/run/saslauthd \
 && export BUILD_DEPS=" \
        autoconf \
        automake \
        curl \
        db-dev \
        g++ \
        gcc \
        gzip \
        heimdal-dev \
        libtool \
        make \
        openldap-dev \
        openssl-dev \
        tar \
        groff \
    " \
 && apk add --update ${BUILD_DEPS} \
        cyrus-sasl \
        libldap \
# Install cyrus-sasl from source
#  && curl -fL ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${CYRUS_SASL_VERSION}.tar.gz -o /tmp/cyrus-sasl.tgz \
 && curl -fL https://codeload.github.com/cyrusimap/cyrus-sasl/tar.gz/cyrus-sasl-${CYRUS_SASL_VERSION} -o /tmp/cyrus-sasl.tgz \
 && tar -xzf /tmp/cyrus-sasl.tgz --strip=1 -C /tmp/cyrus-sasl \
 && cd /tmp/cyrus-sasl \
 && autoreconf -vif \
 && ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-anon \
        --enable-cram \
        --enable-digest \
        --enable-ldapdb \
        --enable-login \
        --enable-ntlm \
        --disable-otp \
        --enable-plain \
        --with-gss_impl=heimdal \
        --with-devrandom=/dev/urandom \
        --with-ldap=/usr \
        --with-saslauthd=/var/run/saslauthd \
        --mandir=/usr/share/man \
 && make -j1 \
 && make -j1 install \
# Clean up build-time packages
 && apk del --purge ${BUILD_DEPS} \
# Clean up anything else
 && rm -fr \
    /tmp/* \
    /var/tmp/* \
    /var/cache/apk/* 

COPY root/ /

VOLUME /config /var/run/saslauthd