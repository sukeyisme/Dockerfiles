FROM i386/alpine:3

RUN apk add  --no-cache wine freetype

ADD idman636build1.exe /

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

ENV DISPLAY 172.17.0.1:14


ENV GID="1000"
ENV UID="1000"
ENV UNAME="idm"
ENV GNAME="idm"
ENV HOME=/home/${UNAME}

RUN addgroup -g ${GID} ${GNAME}
RUN adduser -D -g '' -u ${UID} -h ${HOME} -G ${GNAME} ${UNAME}

RUN apk add --no-cache libx11 

ADD winetricks /usr/bin
RUN  chmod +rx /usr/bin/winetricks

USER ${UNAME}
WORKDIR ${HOME}


ADD idman636build1.exe ${HOME}

RUN wine idman636build1.exe  /skipdlgs