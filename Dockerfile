FROM microsoft/dotnet:runtime

LABEL author="Jat <chat@jat.email>"
ARG VER
LABEL version=$VER

COPY asf /opt/asf
VOLUME /opt/asf/config
WORKDIR /opt/asf

ENTRYPOINT ["/opt/asf/ArchiSteamFarm"]
CMD ["--server"]
