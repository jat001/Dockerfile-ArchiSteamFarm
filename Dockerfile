FROM mono:latest

LABEL author="Jat <chat@jat.email>"
LABEL version="0.0.1"

RUN apt-get update && apt-get install -y jq

RUN mkdir -p /opt/asf/config
WORKDIR /opt/asf

RUN download_url=$(curl https://api.github.com/repos/JustArchi/ArchiSteamFarm/releases/latest | jq '.assets[] | select(.name == "ASF.exe").browser_download_url')
RUN wget -O ASF.exe $download_url

VOLUME /opt/asf/config

ENTRYPOINT ["mono", "/opt/asf/ASF.exe"]
