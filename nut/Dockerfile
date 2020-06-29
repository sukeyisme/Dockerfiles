# FROM python:alpine AS build-env
FROM lsiobase/alpine.python3 As build-env

RUN apk add --no-cache --update gcc musl-dev libffi-dev openssl-dev python3-dev jpeg-dev

RUN python3 -m pip install -U pip

RUN apk add --no-cache py3-qt5

RUN pip install --install-option="--prefix=/install" colorama pyopenssl requests tqdm unidecode Pillow BeautifulSoup4 urllib3 Flask pyusb pyqt5 google-api-python-client google-auth-oauthlib



# FROM sukeyisme/python
FROM lsiobase/alpine.python3

COPY --from=build-env /install /usr/local
RUN apk add --no-cache  py3-tqdm

COPY nut.src.latest /app

COPY root/ /

EXPOSE 9000
VOLUME /config