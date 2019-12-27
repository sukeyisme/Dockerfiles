FROM centos:7 as build

RUN yum -y install make automake gcc gcc-c++ tar unzip bzip2 wget tcl tk gettext gperf ant cppunit-devel libcurl-devel expat-devel openssl-devel bzip2-devel libcap-devel lz4-devel snappy-devel epel-release openssh-clients\
&& yum -y update nss \
&& yum -y install python-pip\
&& pip install pathlib \
&& yum clean all \
&& rm -rf /usr/local/src/*

ADD gcc-5.4.0.tar.gz /tmp/

RUN cd /tmp/gcc-5.4.0 \
&& ./contrib/download_prerequisites \
&& ./configure --prefix=/usr --enable-checking=release --enable-languages=c,c++ --disable-multilib \
&& make \
&& yum -y erase gcc gcc-c++ \
&& make install \
&& cd /usr/bin \
&& ln -s gcc cc \
&& cd -

ADD cmake-3.13.3.tar.gz /tmp/

RUN cd /tmp/cmake-3.13.3 && ./bootstrap && make -j8 && make install

ADD git-2.20.1.tar.gz /tmp/

RUN cd /tmp/git-2.20.1 && make -j8 prefix=/usr install

ADD autoconf-2.69.tar.gz /tmp/
RUN cd /tmp/autoconf-2.69 && ./configure && make -j8 && make install

ADD automake-1.16.1.tar.gz /tmp/
RUN cd /tmp/automake-1.16.1 && ./configure && make -j8 && make install

ADD libtool-2.4.6.tar.gz /tmp/
RUN cd /tmp/libtool-2.4.6 && ./configure && make -j8 && make install

ADD autoconf-archive-2019.01.06.tar.xz /tmp/
RUN cd /tmp/autoconf-archive-2019.01.06 && ./configure && make -j8 && make install

ADD scons-2.5.0.tar.gz /tmp/
RUN cd /tmp/scons-2.5.0 && python setup.py install

RUN cd /tmp && git clone -b v0.3.5 https://github.com/google/glog.git \
&& cd glog && autoreconf -ivf && ./configure && make && make install

RUN cd /tmp && git clone -b v2.2.2 https://github.com/gflags/gflags.git \
&& cd gflags && cmake . -DBUILD_SHARED_LIBS=ON && make && make install

RUN cd /tmp && git clone -b v3.0.3 https://github.com/google/double-conversion.git \
&& cd double-conversion && cmake . -DBUILD_TESTING=ON && make && make install

ADD boost_1_58_0.tar.gz /tmp/
RUN yum -y install python-devel
RUN ls /usr/include/python2.7
RUN  cd /tmp/boost_1_58_0 && ./bootstrap.sh && ./b2 install

RUN cd /tmp && git clone https://github.com/enki/libev.git
RUN ls /tmp/libev
RUN cd /tmp/libev && chmod a+x autogen.sh && ./autogen.sh && ./configure && make && make install

ADD libevent-2.0.22-stable.tar.gz /tmp/
RUN cd /tmp/libevent-2.0.22-stable && ./configure && make && make install

ADD folly-2017.09.04.00.tar.gz /tmp/
RUN cd /tmp/folly-2017.09.04.00/folly && autoreconf -ivf -I /usr/share/aclocal \
&& LD_LIBRARY_PATH=/usr/local/lib ./configure \
&& LD_LIBRARY_PATH=/usr/local/lib make && make install

RUN git --version

ADD wangle-2017.09.04.00.tar.gz /tmp/
RUN cd /tmp/wangle-2017.09.04.00/wangle && cmake . && make && make install

RUN cd /tmp && git clone -b v2017.09.04.00 https://github.com/facebook/proxygen.git
RUN cd /tmp/proxygen/proxygen && autoreconf -ivf && ./configure && make && make install

ADD g3log-1.1 /tmp/g3log
RUN cd /tmp/g3log \
&& cmake -DCMAKE_BUILD_TYPE=Release -DUSE_DYNAMIC_LOGGING_LEVELS=ON . && \
make && \
rm -rf /usr/local/include/g3log && \
mkdir -p /usr/local/include/g3log && \
cp -rp src/g3log/* /usr/local/include/g3log/ && \
cp -p libg3logger_shared.so /usr/local/lib/ && \
cp -p libg3logger.a /usr/local/lib/ && \
cd /usr/local/lib/ && \
ln -s libg3logger_shared.so libg3logger.so && \
ldconfig && cd -

ADD toml-0.10.0.tar.gz /tmp/
RUN cd /tmp/toml-0.10.0 && python setup.py install

ADD protobuf-cpp-3.1.0.tar.gz /tmp/
RUN cd /tmp/protobuf-3.1.0 && ./autogen.sh && ./configure && make && make install

ADD nanomsg-1.1.5.tar.gz /tmp/
RUN cd /tmp/nanomsg-1.1.5 && cmake . && make -j8 && make install

ADD tbb-2019_U3.tar.gz /tmp/
RUN cd /tmp/tbb-2019_U3 && make tbb tbbmalloc tbbproxy && \
cd build && chmod +x *.sh && \
sh generate_tbbvars.sh && \
sh tbbvars.sh 
# cd linux_intel64_gcc_cc5.4.0_libc2.17_kernel3.10.0_release && \
# cp -p libtbb* /usr/lib && ldconfig && cd ../.. && \
# cp -rp include/* /usr/local/include/ && rm -f /usr/local/include/index.html
#TODO: 这里先没有替换

ADD cpptoml-0.1.0.tar.gz /tmp/
RUN cd /tmp/cpptoml-0.1.0 && cmake . && make -j8 && make install

ADD websocketpp-0.8.1.tar.gz /tmp/
RUN cd /tmp/websocketpp-0.8.1 && cmake . && make -j8 && make install

ADD zookeeper-release-3.4.9.tar.gz /tmp/
RUN cd /tmp/zookeeper-release-3.4.9 && ant compile_jute && cd src/c && \
ACLOCAL="aclocal -I /usr/share/aclocal" autoreconf -ivf && \
./configure && make && make install

ADD librdkafka-0.11.6.tar.gz /tmp/
RUN cd /tmp/librdkafka-0.11.6 && ./configure && make -j8 && make install

ADD jsoncpp-1.8.4.tar.gz /tmp/
RUN cd /tmp/jsoncpp-1.8.4 && cmake -DCMAKE_BUILD_TYPE=release -DBUILD_STATIC_LIBS=OFF \
-DBUILD_SHARED_LIBS=ON . && make && make install

RUN yum -y install mysql-devel \
&& ln -s /usr/lib64/mysql/libmysqlclient.so /usr/lib64/libmysqlclient.so

ADD mfast /tmp/mfast
RUN cd /tmp/mfast \ 
&& cmake . -DBUILD_SHARED_LIBS=ON \
-DCMAKE_INSTALL_PREFIX=/usr/local && \
LD_LIBRARY_PATH=/usr/local/lib make && make install

RUN cd /tmp/tbb-2019_U3 && cp -rp include/* /usr/local/include/ && rm -f /usr/local/include/index.html
RUN cd /tmp/tbb-2019_U3/build/linux_intel64_gcc_cc5.4.0_libc2.17_kernel4.9.125_release && \
 cp -p libtbb* /usr/lib && ldconfig 

RUN rm -rf /tmp \
&& yum clean all \
&& rm -rf /usr/local/src/* \
&& rm -rf /var/cache/yum

# FROM centos:7
# COPY --from=build 
