FROM mono:latest

LABEL author="Jat <chat@jat.email>"
ARG VER
LABEL version=$VER

RUN mkdir -p /opt/asf/config
VOLUME /opt/asf/config
WORKDIR /opt/asf

ARG URL
RUN curl -Lo ASF.exe "$URL"

ENTRYPOINT ["mono", "/opt/asf/ASF.exe"]
CMD ["--server"]
