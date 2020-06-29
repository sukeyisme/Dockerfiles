FROM lsiobase/alpine:3.12

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
	autoconf \
	automake \
	freetype-dev \
	g++ \
	gcc \
	jpeg-dev \
	lcms2-dev \
	libffi-dev \
	libpng-dev \
	libwebp-dev \
	libxml2-dev \
	libxslt-dev \
	linux-headers \
	make \
	openjpeg-dev \
	openssl-dev \
	python3-dev \
	tiff-dev \
	zlib-dev && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	curl \
	freetype \
	git \
	lcms2 \
	libjpeg-turbo \
	libwebp \
	libxml2 \
	libxslt \
	openjpeg \
	openssl \
	p7zip \
	py3-pip \
	python3 \
	tar \
	tiff \
	unrar \
	unzip \
	vnstat \
	wget \
	xz \
	zlib && \
 echo "**** install pip packages ****" && \
 pip install --no-cache-dir -U \
	pip && \
 pip install -U \
	cheetah3 \
	configparser \
	lxml \
	ndg-httpsclient \
	notify \
	paramiko \
	pillow \
	psutil \
	pyopenssl \
	requests \
	setuptools \
	urllib3 \
	virtualenv && \
 echo "**** clean up ****" && \
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/root/.cache \
	/tmp/*