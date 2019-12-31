FROM i386/alpine:edge

RUN apk --no-cache upgrade\
  && apk --no-cache add \
  xpra
# py3-paramiko

ENV DISPLAY=":14"
ENV XORG_DPI="96"  
ENV XPRA_TCP_PORT="10000"
ENV XPRA_DPI="96"
ENV GID="1000"
ENV UID="1000"
ENV UNAME="xpra"
ENV GNAME="xpra"

EXPOSE $XPRA_TCP_PORT

RUN addgroup -g ${GID} ${GNAME}
RUN adduser -D -g '' -u ${UID} -G ${GNAME} ${UNAME}

# Xpra mmap
RUN mkdir -p /tmp/xpra-mmap
ENV XDG_RUNTIME_DIR=/tmp/xdg
RUN mkdir -p "${XDG_RUNTIME_DIR}" "/run/user/${UID}/"
RUN chown "${UID}":"${GID}" "${XDG_RUNTIME_DIR}" "/run/user/${UID}/"

# USER ${UNAME}
# WORKDIR /home/${UNAME}
# RUN apk add --no-cache dbus-x11 py-dbus
# RUN apk add --no-cache 	xf86-video-vesa
# RUN apk add --no-cache xf86-video-fbdev
# RUN apk add --no-cache libinput kbd pekwm
# RUN apk add --no-cache mesa-dri-swrast mesa-dri-vmwgfx
# RUN apk add --no-cache xf86-input-keyboard xf86-input-mouse

# RUN dbus-uuidgen > /var/lib/dbus/machine-id

#https://gitlab.alpinelinux.org/alpine/aports/issues/8741
#https://stackoverflow.com/questions/3657860/bash-append-text-to-last-line-of-file
RUN sed -i '${s/$/ -config \/etc\/xpra\/xorg.conf/}' /etc/xpra/conf.d/55_server_x11.conf

# RUN apk add --no-cache py3-cairo
RUN apk add --no-cache xpra-webclient


RUN mkdir -p "/run/xpra"
RUN chown "${UID}":"${GID}" "/run/xpra"

RUN apk add --no-cache xhost



VOLUME /tmp/.X11-unix

RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" \
  >> /etc/apk/repositories
RUN apk add --no-cache py3-inotify

RUN apk add --no-cache su-exec bash

ENV SHELL="/bin/bash"

RUN apk add  --no-cache wine freetype
RUN apk add --no-cache libx11 
RUN apk add --no-cache ncurses
RUN mkdir -p /usr/share/wine/mono /usr/share/wine/gecko \
  && wget https://dl.winehq.org/wine/wine-mono/4.7.5/wine-mono-4.7.5.msi \
  -O /usr/share/wine/mono/wine-mono-4.7.5.msi 

ENV HOME=/home/${UNAME}

# USER ${UNAME}
# WORKDIR ${HOME}



# RUN /usr/local/bin/run 
ADD idman636build1.exe  /

RUN wget https://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86.msi \
  -O /usr/share/wine/gecko/wine_gecko-2.47-x86.msi \
  && wget https://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86_64.msi \
  -O /usr/share/wine/gecko/wine_gecko-2.47-x86_64.msi

ADD tcp_m /usr/local/bin/
RUN chmod 777 /usr/local/bin/tcp_m
ADD run /usr/local/bin/
RUN chmod 777 /usr/local/bin/run
ENTRYPOINT [ "/usr/local/bin/run" ]

CMD [ "xhost +" ]
