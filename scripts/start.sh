#!/bin/bash 
set -e 

ulimit -n 8192 

export DISPLAY=${DISPLAY:-:"10"}
/usr/bin/Xvfb ${DISPLAY} -screen 0 1366x768x24 -ac +render -noreset & 
sleep 10;
x11vnc --display ${DISPLAY} -geometry 1366x768 --forever & 

SELENIUM_PORT=${SELENIUM_PORT:-"4444"}
exec /usr/bin/java -jar /opt/selenium-server.jar -port ${SELENIUM_PORT} 

