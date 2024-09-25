FROM ubuntu:22.04

RUN apt-get update

RUN apt-get install -y apt-utils

RUN apt-get install -y \
	curl \
	git \
	sudo \
	vim \
	wget \
	unzip \
	jq \
	apt-transport-https \
	software-properties-common

RUN curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh && chmod +x install-opentofu.sh && ./install-opentofu.sh --install-method deb && rm install-opentofu.sh

RUN wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
	
RUN apt-get update && apt-get install -y powershell
	
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash