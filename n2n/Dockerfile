FROM centos:7 AS build-env

RUN yum update -y && \
yum groupinstall "Development Tools"  -y && \
yum install openssl-devel net-tools -y

RUN yum install wget -y
WORKDIR /root

RUN wget https://codeload.github.com/ntop/n2n/tar.gz/2.4 \
&& tar -xf 2.4 \
&& cd n2n-2.4 && make && make install

FROM centos:7
COPY --from=build-env /usr/sbin/supernode /usr/sbin/
COPY --from=build-env /usr/sbin/edge /usr/sbin/
RUN yum install net-tools -y
