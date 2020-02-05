FROM antimodes201/steamcmd-base:1.0
MAINTAINER antimodes201

# Set some Variables
ARG GAME_PORT=28015 
ARG RCON_PORT=28016 

ENV GAME_PORT $GAME_PORT
ENV RCON_PORT $RCON_PORT

ADD start.sh /scripts/start.sh
ADD settings.cfg /scripts/settings.cfg

# Expose some port
EXPOSE $GAME_PORT/udp
EXPOSE $GAME_PORT/tcp
EXPOSE $RCON_PORT/udp
EXPOSE $RCON_PORT/tcp


CMD ["/scripts/start.sh"]