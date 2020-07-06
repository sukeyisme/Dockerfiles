FROM sukeyisme/xpra:ubuntu

RUN last_version=$(curl -s "http://pan.baidu.com/disk/cmsdata?do=client"|grep -i -o "http:[0-9a-z/\\\.\_]*\.deb"|sed 's/\\//g') && \
    curl ${last_version} -o /tmp/baidunetdisk_linux.deb && \
    apt-get update && \
    apt-get install -y update-desktop-database && \
    dpkg -i /tmp/baidunetdisk_linux.deb

# add local files
COPY root/ /

VOLUME /downloads /config
