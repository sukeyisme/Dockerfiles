FROM sukeyisme/xpra-wine

ENV SXSERVER_VERSION 1.21

RUN wget "https://sx.xecuter.com/download/sxserver_v${SXSERVER_VERSION}.zip" -O ${HOME}/sxserver.zip \
&& unzip ${HOME}/sxserver.zip \
&& ls ${HOME}

USER root
RUN ln -sf "${HOME}/.wine/drive_c/switch_games" /switch_games

USER ${UNAME}
CMD [ "wine start /unix \"$HOME/sxserver.exe\""]
