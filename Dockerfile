FROM mono:latest

LABEL author="Jat <chat@jat.email>"
ARG VER
LABEL version=$VER

RUN mkdir -p /opt/asf/config
VOLUME /opt/asf/config
WORKDIR /opt/asf

COPY ASF.exe .

ENTRYPOINT ["mono", "ASF.exe"]
CMD ["--server"]
