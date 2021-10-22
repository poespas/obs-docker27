FROM bandi13/gui-docker:1.01

RUN apt update

RUN apt install -y software-properties-common \
	debian-archive-keyring \
	dirmngr

RUN apt-key adv --keyserver keyserver.ubuntu.com \
	--recv-keys 648ACFD622F3D138

RUN apt-key adv --keyserver keyserver.ubuntu.com \
	--recv-keys 0E98404D386FA1D9

RUN apt-key adv --keyserver keyserver.ubuntu.com \
	--recv-keys EFC71127F425E228

RUN add-apt-repository "deb http://mirror.hetzner.de/ubuntu/packages focal main restricted universe multiverse"
RUN add-apt-repository "deb http://mirror.hetzner.de/ubuntu/packages focal-updates main restricted universe multiverse"
RUN add-apt-repository "deb http://mirror.hetzner.de/ubuntu/packages focal-backports main restricted universe multiverse"
RUN add-apt-repository "deb http://mirror.hetzner.de/ubuntu/packages focal-security main restricted universe multiverse"
RUN add-apt-repository "deb http://mirror.hetzner.de/ubuntu/packages focal main restricted universe multiverse"
RUN add-apt-repository "deb http://mirror.hetzner.de/ubuntu/packages focal-updates main restricted universe multiverse"
RUN add-apt-repository "deb http://mirror.hetzner.de/ubuntu/packages focal-backports main restricted universe multiverse"
RUN add-apt-repository "deb http://mirror.hetzner.de/ubuntu/packages focal-security main restricted universe multiverse"
RUN add-apt-repository "deb http://ppa.launchpad.net/obsproject/obs-studio/ubuntu focal main"
RUN add-apt-repository "deb http://ppa.launchpad.net/obsproject/obs-studio/ubuntu focal main"

RUN add-apt-repository "deb http://ftp.de.debian.org/debian sid main"

# RUN add-apt-repository "deb https://mirror.hetzner.com/ubuntu/packages focal/universe amd64"

# RUN sleep 1 && apt-cache madison obs-studio

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcrypt1

# !!
RUN DEBIAN_FRONTEND=noninteractive apt install obs-studio=27.1.3-0obsproject1~focal -y

RUN echo "?package(bash):needs=\"X11\" section=\"DockerCustom\" title=\"OBS Screencast\" command=\"obs\"" >> /usr/share/menu/custom-docker && update-menus