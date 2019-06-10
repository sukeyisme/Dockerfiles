# FROM centos:7 AS build-env

# RUN yum update -y && \
# yum groupinstall "Development Tools"  -y && \
# yum install openssl-devel net-tools -y

# RUN yum install wget -y
# WORKDIR /root

# RUN wget https://codeload.github.com/ntop/n2n/tar.gz/2.4 \
# && tar -xf 2.4 \
# && cd n2n-2.4 && make && make install

# RUN wget https://codeload.github.com/ntop/n2n/zip/dev \
# && unzip dev \
# && cd n2n-dev && make && make install

# RUN yum install -y cmake

# RUN wget https://codeload.github.com/meyerd/n2n/zip/master \
# && unzip master \
# && cd n2n-master/n2n_v2 && cmake . && make

FROM centos:7
# COPY --from=build-env /usr/sbin/supernode /usr/sbin/
# COPY --from=build-env /usr/sbin/edge /usr/sbin/
# COPY --from=build-env /root/n2n-master/n2n_v2/supernode /usr/sbin/supernodev2s
# COPY --from=build-env /root/n2n-master/n2n_v2/edge /usr/sbin/edgev2s
RUN yum install net-tools -y
RUN yum install wget -y
RUN cd /etc/yum.repos.d/ \
&& wget http://packages.ntop.org/centos/ntop.repo -O ntop.repo \
&& rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
&& yum erase zeromq3\
&& yum clean all\
&& yum update -y\
&& yum install pfring-dkms n2disk nprobe ntopng cento n2n -y
