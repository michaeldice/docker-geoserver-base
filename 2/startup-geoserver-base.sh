#!/bin/sh
if [ $DISABLE_GEOSERVER_CONSOLE = "true" ]; then
    rm "/opt/geoserver/webapps/geoserver/WEB-INF/lib/gs-web-*.jar"
fi
/opt/geoserver/bin/startup.sh
