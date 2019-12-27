FROM centos:7 AS build-env

RUN yum update -y && \
yum groupinstall "Development Tools"  -y && \
yum install openssl-devel net-tools -y

RUN yum install wget -y
WORKDIR /root

RUN yum install -y cmake

RUN wget https://codeload.github.com/meyerd/n2n/zip/master \
&& unzip master \
&& cd n2n-master/n2n_v2 && cmake . && make

FROM centos:7
COPY --from=build-env /root/n2n-master/n2n_v2/supernode /usr/sbin/supernodev2s
COPY --from=build-env /root/n2n-master/n2n_v2/edge /usr/sbin/edgev2s
