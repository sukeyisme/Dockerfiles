FROM sukeyisme/xpra-wine

RUN apk add  --no-cache wine freetype

# Download mono and gecko
ARG MONO_VER
ARG GECKO_VER
RUN mkdir -p /usr/share/wine/mono /usr/share/wine/gecko \
  && wget https://dl.winehq.org/wine/wine-mono/${MONO_VER}/wine-mono-${MONO_VER}.msi \
  -O /usr/share/wine/mono/wine-mono-${MONO_VER}.msi \
  && wget https://dl.winehq.org/wine/wine-gecko/${GECKO_VER}/wine-gecko-${GECKO_VER}-x86.msi \
  -O /usr/share/wine/gecko/wine_gecko-${GECKO_VER}-x86.msi \
  && wget https://dl.winehq.org/wine/wine-gecko/${GECKO_VER}/wine-gecko-${GECKO_VER}-x86_64.msi \
  -O /usr/share/wine/gecko/wine_gecko-${GECKO_VER}-x86_64.msi



#ENV GID="1000"
#ENV UID="1000"
#ENV UNAME="idm"
#ENV GNAME="idm"
ENV HOME=/home/${UNAME}

#RUN addgroup -g ${GID} ${GNAME}
#RUN adduser -D -g '' -u ${UID} -h ${HOME} -G ${GNAME} ${UNAME}

RUN apk add --no-cache libx11 
RUN apk add --no-cache ncurses

# RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" \
# >> /etc/apk/repositories
# RUN apk add --no-cache wine-mono wine_gecko

#ADD winetricks /usr/bin
#RUN  chmod +rx /usr/bin/winetricks

USER ${UNAME}
WORKDIR ${HOME}

# RUN wine msiexec /i /usr/share/wine/gecko/wine_gecko-${GECKO_VER}-x86_64.msi
# RUN wine msiexec /i /usr/share/wine/gecko/wine_gecko-${GECKO_VER}-x86.msi
RUN wine msiexec /i /usr/share/wine/mono/wine-mono-${MONO_VER}.msi

ADD idman636build1.exe ${HOME}

RUN mv 


#RUN wine idman636build1.exe  /skipdlgs