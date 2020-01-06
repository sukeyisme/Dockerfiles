FROM sukeyisme/xpra-wine

ENV XPRA_DAEMON="yes"
# sleep for install idm
RUN rm /tmp/.X14-lock
RUN wget "http://mirror2.internetdownloadmanager.com/idman636build1.exe?b=1&filename=idman636build1.exe" -O ${HOME}/idman.exe \
  &&  /usr/local/bin/run "wine idman.exe  /skipdlgs" && sleep 30 && rm idman.exe
ENV XPRA_DAEMON="no"

USER root
RUN ln -sf "${HOME}/.wine/drive_c/users/${UNAME}/Downloads" /mnt
RUN ln -sf "${HOME}/.wine/drive_c/users/${UNAME}/Application Data/IDM" /mnt
RUN ln -sf "${HOME}/.wine/drive_c/users/${UNAME}/Application Data/DMCache" /mnt

USER ${UNAME}
CMD [ "wine start \"C:\\Program Files\\Internet Download Manager\\IDMan.exe\""]