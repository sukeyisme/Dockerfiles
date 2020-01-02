FROM i386/alpine:edge

# last xpra 3.0.4 20191223
RUN apk --no-cache upgrade\
  && apk --no-cache add \
  xpra \
  py3-cairo

ENV DISPLAY=":14"
# ENV XORG_DPI="96"  
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


#may be try debian
#https://gitlab.alpinelinux.org/alpine/aports/issues/8741
#https://github.com/mviereck/x11docker/issues/117
#https://stackoverflow.com/questions/3657860/bash-append-text-to-last-line-of-file
# RUN sed -i '${s/$/ -config \/etc\/xpra\/xorg.conf/}' /etc/xpra/conf.d/55_server_x11.conf
RUN sed -i 's/xpra_Xdummy/xpra_Xdummy\ -dpi 96\ -ac/' /etc/xpra/conf.d/55_server_x11.conf
RUN sed -i.bak 's#\(config \).*buildozer.*xorg\.conf#\1/etc/xpra/xorg.conf#g' /etc/xpra/conf.d/55_server_x11.conf \
  && rm /etc/xpra/conf.d/55_server_x11.conf.bak

# RUN apk add --no-cache py3-cairo


RUN mkdir -p "/run/xpra"
RUN chown "${UID}":"${GID}" "/run/xpra"

# RUN apk add --no-cache xhost



# VOLUME /tmp/.X11-unix

# RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" \
#   >> /etc/apk/repositories
# RUN apk add --no-cache py3-inotify

# RUN apk add --no-cache su-exec bash

# ENV SHELL="/bin/bash"

# RUN apk add  --no-cache wine freetype
# RUN apk add --no-cache libx11 
# RUN apk add --no-cache ncurses
# RUN mkdir -p /usr/share/wine/mono /usr/share/wine/gecko \
#   && wget https://dl.winehq.org/wine/wine-mono/4.7.5/wine-mono-4.7.5.msi \
#   -O /usr/share/wine/mono/wine-mono-4.7.5.msi 




# RUN /usr/local/bin/run 
# ADD idman636build1.exe  /

# RUN wget https://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86.msi \
#   -O /usr/share/wine/gecko/wine_gecko-2.47-x86.msi \
#   && wget https://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86_64.msi \
#   -O /usr/share/wine/gecko/wine_gecko-2.47-x86_64.msi

ADD tcp_m /usr/local/bin/
RUN chmod 777 /usr/local/bin/tcp_m

ENV HOME=/home/${UNAME}
ENV XPRA_DAEMON="no"

RUN apk add --no-cache xterm

USER ${UNAME}
WORKDIR ${HOME}
# ADD run /usr/local/bin/
# RUN chmod 777 /usr/local/bin/run
RUN echo "test"
RUN cat /etc/xpra/conf.d/55_server_x11.conf 

ENV XPRA_DEFAULT_VFB_RESOLUTION=1600x900

ENTRYPOINT [ "/usr/local/bin/tcp_m" ]
# CMD [ "xhost +" ]
CMD [ "xterm" ]
