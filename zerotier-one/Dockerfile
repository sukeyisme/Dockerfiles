FROM centos:7
LABEL Version="1.2.12"

COPY build.sh /usr/bin/
RUN build.sh

COPY exec.sh /usr/sbin/
ENTRYPOINT ["/usr/sbin/exec.sh"]
