FROM: ubuntu:16.04

MAINTAINER antimodes201 (

# quash warnings
ARG DEBIAN_FRONTEND=noninteractive

USER root

dpkg --add-architecture i386
apt update 
apt install mailutils \ 
postfix \
curl \ 
wget \
file \
bzip2 \
gzip \
unzip \
bsdmainutils \
python \
util-linux \
ca-certificates \
binutils \
bc \
jq \
tmux \
lib32gcc1 \
libstdc++6 \
libstdc++6:i386 \


# Set some Variables
ENV BRANCH "public"
ENV INSTANCE_NAME "default"


# dependencies
RUN dpkg --add-architecture i386
	apt-get update && \
	apt-get install -y --no-install-recommends \
    wget \
	lib32stdc++6 \
	lib32gcc1 \
	lib32z1 \
	libstdc++6:i386 \
	mailutils \ 
	postfix \
	curl \ 
	file \
	bzip2 \
	gzip \
	unzip \
	bsdmainutils \
	python \
	util-linux \
	ca-certificates \
	binutils \
	bc \
	jq \
	tmux \	
    rm -rf /var/lib/apt/lists/*

# add steam user	
RUN adduser \
    --disabled-login \
    --disabled-password \
    --shell /bin/bash \
    steam && \
    usermod -G tty steam \
	mkdir -p /rust \
	chown steam:steam /rust

USER steam
RUN cd /rust && \
	wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh rustserver \
	/rust/rustserver install

	
ADD start.sh /rust/start.sh

# Expose some port
EXPOSE 28015/tcp
EXPOSE 28015/udp
EXPOSE 28016/tcp
EXPOSE 28016/udp

# Make a volume
# side note, maybe make the entire directory persistent to lower boot time?
VOLUME /rust

CMD ["/rust/start.sh"]