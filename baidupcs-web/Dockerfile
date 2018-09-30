FROM busybox

ENV VERSION 3.5.5
RUN wget https://github.com/liuzhuoling2011/baidupcs-web/releases/download/${VERSION}/BaiduPCS-Go-${VERSION}-linux-64 \
&& mv BaiduPCS-Go-${VERSION}-linux-64 baidupcs \
&& chmod a+x baidupcs

ENTRYPOINT ["./baidupcs"]
