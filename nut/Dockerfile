FROM python:alpine AS build-env

RUN apk add --no-cache --update gcc musl-dev libffi-dev openssl-dev python3-dev jpeg-dev

RUN pip install --install-option="--prefix=/install" colorama pyopenssl requests tqdm unidecode image bs4 urllib3 flask


FROM  python:alpine
COPY --from=build-env /install /usr/local

RUN apk add --no-cache libjpeg-turbo

ENTRYPOINT ["python", "nut.py"]

