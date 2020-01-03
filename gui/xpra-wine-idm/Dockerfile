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
RUN ln -sf "${HOME}/.wine/drive_c/users/${UNAME}/Downloads" /mnt
RUN ln -sf "${HOME}/.wine/drive_c/users/${UNAME}/Application Data/IDM" /mnt
RUN ln -sf "${HOME}/.wine/drive_c/users/${UNAME}/Application Data/DMCache" /mnt
RUN ls ${HOME}/.wine
RUN mkdir -p /mnt/reg && ln "${HOME}/.wine/user.reg" /mnt/reg/user.reg
RUN ls /mnt/reg

# RUN wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
#   && chmod +x winetricks
# RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" \
# >> /etc/apk/repositories
# RUN apk add --no-cache winetricks
# RUN apk add --no-cache ca-certificates wget && update-ca-certificates
USER ${UNAME}
# RUN rm /tmp/.X14-lock
# ENV XPRA_DAEMON="yes"
# RUN /usr/local/bin/tcp_m "wineboot -u && winetricks ie8" && sleep 300
# ENV XPRA_DAEMON="no"
# RUN wineboot -u && winetricks --self-update && winetricks ie8
ENV XPRA_WIN32_MAX_SIZE_HINT=1
# WORKDIR /home/xpra/.wine/drive_c/Program Files/Internet Download Manager
# CMD [ "wine IDMan.exe"]
CMD [ "wine start /max \"C:\\Program Files\\Internet Download Manager\\IDMan.exe\""]
# CMD [ "wine start /max \"C:\\Program Files\\Internet Explorer\\iexplore.exe\""]
# CMD [ "wine explorer \/desktop=test,1024x768 \"/home/xpra/.wine/drive_c/Program\ Files/Internet\ Download\ Manager/IDMan.exe\""]