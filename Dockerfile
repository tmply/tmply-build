FROM debian:stretch

RUN apt-get -y update && \
	apt-get -y install wget openjdk-8-jdk maven ant

RUN wget -O /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
	apt-get -y install gconf-service libgconf-2-4 libxss1 fonts-liberation libappindicator1 lsb-release xdg-utils chromedriver && \
	dpkg -i /tmp/google-chrome-stable_current_amd64.deb && \
	rm /tmp/google-chrome-stable_current_amd64.deb

RUN apt-get remove --purge -y $(apt-mark showauto) && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir /build
WORKDIR /build
