# references
# https://github.com/eliotjordan/docker-geoserver
# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
# https://docs.geoserver.org/stable/en/user/installation/linux.html
# http://docs.geonode.org/en/master/tutorials/advanced/geonode_production/adv_gsconfig/gsproduction.html

FROM ubuntu:18.04

ARG GS_VERSION=2.13.0
ARG GS_ARCHIVE_FILENAME=geoserver-${GS_VERSION}-bin.zip
ARG GS_URL=https://downloads.sourceforge.net/project/geoserver/GeoServer/${GS_VERSION}/${GS_ARCHIVE_FILENAME}

# for correct cpu/memory detection inside a container
ENV JAVA_OPTS -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
ENV GEOSERVER_HOME /opt/geoserver

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /tmp

RUN apt-get update && \
    # need these just during build
    apt-get --yes install wget unzip && \
    # need this to run geoserver
    apt-get --yes install openjdk-8-jre-headless

# download geoserver archive
RUN wget $GS_URL
RUN unzip geoserver-$GS_VERSION-bin.zip
RUN mv geoserver-$GS_VERSION $GEOSERVER_HOME

WORKDIR /opt/geoserver/bin
RUN chmod +x startup.sh

# clean up
RUN apt-get --yes purge wget unzip && apt-get --yes clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8080
ENTRYPOINT ["/opt/geoserver/bin/startup.sh"]