FROM openjdk:8-jre-alpine
LABEL maintainer "masato-kataoka"

RUN apk add --no-cache \
	bash \
	curl \
	g++ \
	gcc \
	glib-dev \
	libc6-compat \
	make \
	openssh \
	py-pip \
	python \
	python-dev \
	ruby \
	ruby-bundler \
	ruby-dev \
	ruby-json \
	shadow

RUN pip install --upgrade pip
RUN pip install python-dateutil

# If you're reading this and have any feedback on how this image could be
#   improved, please open an issue or a pull request so we can discuss it!

# Use --build-arg with docker build command to override these values.
# For example,
# docker build . --build-arg DIGDAG_VERSION=latest \
#                --build-arg EMBULK_VERSION=latest
ARG DIGDAG_DOWNLOAD_SERVER=https://dl.digdag.io
ARG EMBULK_DOWNLOAD_SERVER=https://dl.embulk.org
ARG DIGDAG_VERSION=latest
ARG EMBULK_VERSION=latest

COPY digdag.properties /etc/digdag.properties
COPY run-digdag.sh /home/digdag/run-digdag.sh
COPY GemFile /home/digdag/GemFile
COPY station20190405free.csv /home/digdag/station20190405free.csv

RUN curl  -o /usr/bin/digdag --create-dirs -L $DIGDAG_DOWNLOAD_SERVER/digdag-$DIGDAG_VERSION.jar && \
	chmod +x /usr/bin/digdag

RUN curl  -o /usr/bin/embulk --create-dirs -L $EMBULK_DOWNLOAD_SERVER/embulk-$EMBULK_VERSION.jar && \
	chmod +x /usr/bin/embulk

RUN chmod +x /home/digdag/run-digdag.sh

RUN useradd -d /home/digdag -s /sbin/nologin -U digdag && \
	chown digdag /home/digdag

WORKDIR /home/digdag

USER digdag

# Install as the digdag user
RUN embulk gem install -g /home/digdag/GemFile

ENV CONFIG_FILE=/etc/digdag.properties
ENV ADDITIONAL_DIGDAG_CLI_PARAMETERS=

EXPOSE 65432 65433

CMD ["/bin/bash", "-c", "./run-digdag.sh $ADDITIONAL_DIGDAG_CLI_PARAMETERS"]
