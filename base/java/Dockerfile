FROM lsiobase/alpine:3.12

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	tar \
	wget \
    openjdk8 &&\
 echo "**** clean up ****" && \
 rm -rf \
	/root/.cache \
	/tmp/*