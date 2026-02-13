# Start with Ubuntu
FROM ubuntu:22.04

# avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Dependencies for Zomboid server Ubuntu and Steam CMD
# https://help.clouding.io/hc/en-us/articles/10469039218716-How-to-Create-a-Project-Zomboid-Server-on-Linux
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends --verbose-versions software-properties-common && \
    add-apt-repository multiverse && \
    apt-get update && apt-get install -y --no-install-recommends \
    screen curl wget file tar bzip2 gzip unzip bsdmainutils python3 util-linux ca-certificates \
    binutils bc jq tmux netcat lib32gcc-s1 lib32stdc++6 libsdl2-2.0-0:i386 \
    default-jre rng-tools5 && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m steam
USER steam
WORKDIR /home/steam

# download SteamCMD
RUN mkdir Steam && cd Steam && \
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

# create the directory for the dedicated server and other save shit in steam/zomboid
RUN mkdir -p ${INSTALL_DIR} /home/steam/zomboid

# Copy the entrypoint.sh to the working directory /home/steasm
COPY entrypoint.sh /home/steam/entrypoint.sh

# Run the setup script
ENTRYPOINT ["/bin/bash", "/home/steam/entrypoint.sh"]