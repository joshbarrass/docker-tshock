FROM mono

WORKDIR /usr/server
RUN  apt-get update \
  && apt-get install -y wget unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV TSHOCKVERSION=4.3.26

RUN wget https://github.com/Pryaxis/TShock/releases/download/v$TSHOCKVERSION/tshock_$TSHOCKVERSION.zip -O server.zip \
  && unzip server.zip \
  && rm server.zip \
  && mkdir /config \
  && touch /config/ServerLog.txt \
  && ln -s /config/ServerLog.txt /usr/server/ServerLog.txt \
  && mv /usr/server/ServerPlugins /config \
  && ln -s /config/ServerPlugins /usr/server/ServerPlugins \
  && mkdir -p ~/.local/share/Terraria \
  && ln -s /worlds ~/.local/share/Terraria/Worlds

VOLUME /config /worlds

COPY run-server.sh run-server.sh
COPY MIT MIT
RUN chmod +x TerrariaServer.exe run-server.sh

EXPOSE 7777

CMD ["./run-server.sh"]
