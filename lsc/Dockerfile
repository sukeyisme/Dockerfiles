FROM sukeyisme/openjdk8

ENV VERSION=2.1.5

RUN \
 echo "**** download lsc tarball****" &&\
 wget https://lsc-project.org/archives/lsc-core-${VERSION}-dist.tar.gz &&\
 tar zxvf lsc-core-${VERSION}-dist.tar.gz && \
 mv lsc-${VERSION}/* /app &&\
 echo "**** add cron clean entry task ****" && \
 echo "/app/bin/lsc -f /config -c all" > /etc/periodic/daily/ldap_clean && \
 chmod +x /etc/periodic/daily/ldap_clean && \
 echo "**** clean up ****" &&\
 rm lsc-core-${VERSION}-dist.tar.gz

COPY root/ /

VOLUME /config