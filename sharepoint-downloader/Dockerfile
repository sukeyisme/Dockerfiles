FROM node:alpine

RUN apk add  --no-cache wget

RUN wget https://codeload.github.com/axzxc1236/SharepointDownloader/zip/master -O master.zip \
  && unzip master.zip \
  && rm master.zip \
  && cd SharepointDownloader-master \
  && npm i 

WORKDIR /SharepointDownloader-master
VOLUME /SharepointDownloader-master
ENTRYPOINT ["node","./"]
