FROM mono:latest

LABEL author="Jat <chat@jat.email>"
LABEL version="2.3.1.2-1"

RUN echo 'deb http://deb.debian.org/debian wheezy-backports main contrib non-free' >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y jq

RUN mkdir -p /opt/asf/config
WORKDIR /opt/asf

RUN curl -Lo ASF.exe $(curl https://api.github.com/repos/JustArchi/ArchiSteamFarm/releases/latest | jq -r '.assets[] | select(.name == "ASF.exe").browser_download_url')

VOLUME /opt/asf/config

ENTRYPOINT ["mono", "/opt/asf/ASF.exe"]
