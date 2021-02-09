# FROM python:alpine AS build-env
FROM sukeyisme/python3 As build-env

RUN apk add --no-cache --update gcc musl-dev libffi-dev openssl-dev python3-dev jpeg-dev git

RUN python3 -m pip install -U pip

# RUN apk add --no-cache py3-qt5

RUN pip install --prefix="/install" colorama pyopenssl requests unidecode Pillow urllib3 Flask pyusb google-auth-oauthlib bs4



FROM sukeyisme/python3
ARG NUT_RELEASE
ENV NUT_PATH="/config/www/nut"
COPY --from=build-env /install /usr
RUN apk add --no-cache  py3-tqdm  py3-beautifulsoup4 py3-google-api-python-client  py3-qt5

RUN echo "**** set version tag ****" && \
    if [ -z ${NUT_RELEASE+x} ]; then \
           NUT_RELEASE=$(curl -s https://api.github.com/repos/blawar/nut/releases/latest \
           | awk -F\" '/tag_name/ {print $4;exit}'); \
    fi && \
    echo '**** Downloading nut version ****' ${NUT_RELEASE} && \
    curl -sSL -o /app/nut.tar.gz https://github.com/blawar/nut/archive/${NUT_RELEASE}.tar.gz && \
    echo '**** cleanup ****' && \
    rm -rf /var/cache/apk/*

COPY root/ /

EXPOSE 9000
VOLUME /config