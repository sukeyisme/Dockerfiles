# FROM python:alpine AS build-env
FROM sukeyisme/python3 As build-env

RUN apk add --no-cache --update gcc musl-dev libffi-dev openssl-dev python3-dev jpeg-dev

RUN python3 -m pip install -U pip

# RUN apk add --no-cache py3-qt5

RUN pip install --prefix="/install" colorama pyopenssl requests unidecode Pillow urllib3 Flask pyusb google-auth-oauthlib bs4



FROM sukeyisme/python3
# FROM lsiobase/alpine.python3

COPY --from=build-env /install /usr
RUN apk add --no-cache  py3-tqdm  py3-beautifulsoup4 py3-google-api-python-client  py3-qt5

COPY nut.src.latest /app

COPY root/ /

EXPOSE 9000
VOLUME /config