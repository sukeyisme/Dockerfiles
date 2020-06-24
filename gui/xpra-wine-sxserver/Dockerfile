FROM sukeyisme/xpra-wine:x64

ENV SXSERVER_VERSION 1.21

RUN wget "https://sx.xecuter.com/download/sxserver_v${SXSERVER_VERSION}.zip" -O ${HOME}/sxserver.zip \
&& unzip ${HOME}/sxserver.zip \
&& ls ${HOME}

USER root
RUN ln -sf "${HOME}/.wine/drive_c/switch_games" /switch_games

# USER ${UNAME}
CMD [ "wine64 start /unix \"\/home\/xpra\/sxserver.exe\""]
