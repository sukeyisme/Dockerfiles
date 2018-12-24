FROM lsiobase/alpine

ENV VERSION 3.6.1
RUN wget http://qiniu.zoranjojo.top/BaiduPCS-Go-${VERSION}-linux-amd64.zip \
&& unzip BaiduPCS-Go-${VERSION}-linux-amd64.zip \
&& mv BaiduPCS-Go-${VERSION}-linux-amd64/BaiduPCS-Go baidupcs \
&& chmod a+x baidupcs \
&& rm -rf BaiduPCS-Go-${VERSION}-linux-amd64 \
&& rm BaiduPCS-Go-${VERSION}-linux-amd64.zip

ENTRYPOINT ["./baidupcs"]
