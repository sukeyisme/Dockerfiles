FROM lsiobase/alpine:3.8 AS build-env

RUN apk add  --no-cache git go musl-dev

RUN go get -u -v github.com/iikira/BaiduPCS-Go 

FROM lsiobase/alpine:3.8
COPY --from=build-env /root/go/bin/BaiduPCS-Go /usr/sbin/
ENV LANG C.UTF-8
ENV DOWNLOAD_DIR downloads
ENV THREAD_NUM 16
CMD BaiduPCS-Go d --stream --locate -p $THREAD_NUM $DOWNLOAD_DIR