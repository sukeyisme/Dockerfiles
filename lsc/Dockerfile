FROM sukeyisme/openjdk8

ENV VERSION=2.1.5

RUN \
 echo "**** download lsc tarball****" &&\
 wget https://lsc-project.org/archives/lsc-core-{VERSION}-dist.tar.gz &&\
 tar zxvf lsc-core-{VERSION}-dist.tar.gz

COPY nut.src.latest /app

COPY root/ /

EXPOSE 9000
VOLUME /config