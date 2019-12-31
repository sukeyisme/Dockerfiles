FROM sukeyisme/xpra-wine

# RUN apk add  --no-cache wine freetype

# ENV GID="1000"
# ENV UID="1000"
# ENV UNAME="idm"
# ENV GNAME="idm"
# ENV HOME=/home/${UNAME}

#RUN addgroup -g ${GID} ${GNAME}
#RUN adduser -D -g '' -u ${UID} -h ${HOME} -G ${GNAME} ${UNAME}

# RUN apk add --no-cache libx11 
# RUN apk add --no-cache ncurses

# RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" \
# >> /etc/apk/repositories
# RUN apk add --no-cache wine-mono wine_gecko

#ADD winetricks /usr/bin
#RUN  chmod +rx /usr/bin/winetricks

# USER ${UNAME}
# WORKDIR ${HOME}


ADD idman636build1.exe ${HOME}
ENV XPRA_DAEMON="yes"

# sleep for install idm
RUN rm /tmp/.X14-lock
RUN /usr/local/bin/tcp_m "wine idman636build1.exe  /skipdlgs" && sleep 30
ENV XPRA_DAEMON="no"

USER root
RUN apk add --no-cache dbus py3-paramiko
RUN dbus-uuidgen > /var/lib/dbus/machine-id
RUN apk add --no-cache xterm
USER ${UNAME}
ENV XPRA_WIN32_MAX_SIZE_HINT=1
CMD [ "wine start /max \"C:\\Program Files\\Internet Download Manager\\IDMan.exe\""]
# CMD [ "wine "/home/xpra/.wine/drive_c/Program\ Files/Internet\ Download\ Manager/IDMan.exe"]