FROM lsiobase/alpine:3.8 AS build-env

RUN apk add  --no-cache tmux git go musl-dev

RUN go get -u -v github.com/iikira/BaiduPCS-Go 

FROM lsiobase/alpine:3.8
COPY --from=build-env /root/go/bin/BaiduPCS-Go /usr/sbin/
RUN apk add --no-cache tmux
ENV LANG C.UTF-8
CMD tmux new -d -s baidu BaiduPCS-Go d --stream --locate -p 16 downloads/ & top