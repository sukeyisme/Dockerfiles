FROM python:alpine AS build-env

RUN apk add --no-cache --update gcc musl-dev libffi-dev openssl-dev python3-dev jpeg-dev

RUN pip install --install-option="--prefix=/install" colorama pyopenssl requests tqdm unidecode image bs4 urllib3 flask


FROM  python:alpine
COPY --from=build-env /install /usr/local
WORKDIR /root
RUN wget https://codeload.github.com/blawar/nut/zip/master \
&& unzip master \
&& rm master

RUN apk add --no-cache libjpeg-turbo

WORKDIR /root/nut-master

ENTRYPOINT ["python", "nut.py"]

