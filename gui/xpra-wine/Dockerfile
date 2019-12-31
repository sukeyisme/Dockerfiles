FROM sukeyisme/xpra

USER root
RUN apk add  --no-cache wine

ARG MONO_VER
ARG GECKO_VER

# mono and gecko and wine must version matched
RUN mkdir -p /usr/share/wine/mono /usr/share/wine/gecko 
ADD wine-mono-4.7.5.msi /usr/share/wine/mono/
ADD wine_gecko-2.47-x86_64.msi /usr/share/wine/gecko/
ADD wine_gecko-2.47-x86.msi /usr/share/wine/gecko/
# && wget https://dl.winehq.org/wine/wine-mono/${MONO_VER}/wine-mono-${MONO_VER}.msi \
# -O /usr/share/wine/mono/wine-mono-${MONO_VER}.msi \ 
# && wget https://dl.winehq.org/wine/wine-gecko/${GECKO_VER}/wine_gecko-${GECKO_VER}-x86.msi \
# -O /usr/share/wine/gecko/wine_gecko-${GECKO_VER}-x86.msi \
# && wget https://dl.winehq.org/wine/wine-gecko/${GECKO_VER}/wine_gecko-${GECKO_VER}-x86_64.msi \
# -O /usr/share/wine/gecko/wine_gecko-${GECKO_VER}-x86_64.msi

USER ${UNAME}

ENV XPRA_DAEMON="yes"
# sleep for install idm
RUN echo "test"
RUN /usr/local/bin/tcp_m "wine msiexec /i /usr/share/wine/mono/wine-mono-4.7.5.msi /quiet" && sleep 30
RUN rm /tmp/.X14-lock
RUN /usr/local/bin/tcp_m "wine msiexec /i /usr/share/wine/gecko/wine_gecko-2.47-x86_64.msi /quiet" && sleep 30
RUN rm /tmp/.X14-lock
RUN /usr/local/bin/tcp_m "wine msiexec /i /usr/share/wine/gecko/wine_gecko-2.47-x86.msi /quiet" && sleep 30
ENV XPRA_DAEMON="no"
# RUN wine msiexec /i /usr/share/wine/mono/wine-mono-4.7.5.msi
# RUN wine msiexec /i /usr/share/wine/gecko/wine_gecko-2.47-x86_64.msi
# RUN wine msiexec /i /usr/share/wine/gecko/wine_gecko-2.47-x86.msi
CMD [ "wine --version" ]