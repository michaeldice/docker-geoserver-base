# references
# https://github.com/eliotjordan/docker-geoserver
# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
# https://docs.geoserver.org/stable/en/user/installation/linux.html
# http://docs.geonode.org/en/master/tutorials/advanced/geonode_production/adv_gsconfig/gsproduction.html

FROM openjdk:8-jre-alpine

ARG GS_VERSION=2.14.2
ARG GS_ARCHIVE_FILENAME=geoserver-${GS_VERSION}-bin.zip
ARG GS_URL=https://downloads.sourceforge.net/project/geoserver/GeoServer/${GS_VERSION}/${GS_ARCHIVE_FILENAME}
ARG GS_CSS_ARCHIVE_FILENAME=geoserver-${GS_VERSION}-css-plugin.zip
ARG GS_CSS_URL=http://sourceforge.net/projects/geoserver/files/GeoServer/${GS_VERSION}/extensions/${GS_CSS_ARCHIVE_FILENAME}
ARG GS_WPS_ARCHIVE_FILENAME=geoserver-${GS_VERSION}-wps-plugin.zip
ARG GS_WPS_URL=http://sourceforge.net/projects/geoserver/files/GeoServer/${GS_VERSION}/extensions/${GS_WPS_ARCHIVE_FILENAME}
# for correct cpu/memory detection inside a container
ENV JAVA_OPTS -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
ENV GEOSERVER_HOME /opt/geoserver

WORKDIR /tmp

RUN set -ex && \
    # need these just during build
    apk add --no-cache wget unzip && \
    # download and extract geoserver archive
    wget "$GS_URL" && \
    unzip "$GS_ARCHIVE_FILENAME" && \
    mkdir -p "/opt" && \
    mv "geoserver-$GS_VERSION" "$GEOSERVER_HOME" && \
    chmod +x "${GEOSERVER_HOME}/bin/startup.sh" && \
    # install WPS extension
    wget "$GS_WPS_URL" && \
    unzip "$GS_WPS_ARCHIVE_FILENAME" -d "/opt/geoserver/webapps/geoserver/WEB-INF/lib" && \
    # install CSS extension
    wget "$GS_CSS_URL" && \
    unzip "$GS_CSS_ARCHIVE_FILENAME" -d "/opt/geoserver/webapps/geoserver/WEB-INF/lib" && \
    # clean up
    rm "$GS_WPS_ARCHIVE_FILENAME" && \
    rm "$GS_CSS_ARCHIVE_FILENAME" && \
    rm "$GS_ARCHIVE_FILENAME" && \
    apk del --no-cache wget unzip

EXPOSE 8080
ENTRYPOINT ["/opt/geoserver/bin/startup.sh"]
