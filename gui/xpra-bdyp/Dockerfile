FROM sukeyisme/xpra:ubuntu

RUN last_version=$(curl -s "http://pan.baidu.com/disk/cmsdata?do=client"|grep -i -o "http:[0-9a-z/\\\.\_]*\.rpm"|sed 's/\\//g') && \
    wget ${last_version} -O /tmp/baidunetdisk_linux.deb && \
    dpkg -i /tmp/baidunetdisk_linux.deb

# add local files
COPY root/ /

VOLUME /downloads /config