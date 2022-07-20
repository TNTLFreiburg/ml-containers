#!/bin/bash
cp -r /tmp_home/. /home/jovyan

mkdir -p /opt/noVNC`dirname ${NB_PREFIX}`
ln -s /opt/noVNC /opt/noVNC${NB_PREFIX}

xset s off
xset s noblank

exec /bin/run.sh "$@"
