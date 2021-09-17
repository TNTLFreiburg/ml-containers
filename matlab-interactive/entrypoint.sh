#!/bin/bash
cp -r /tmp_home/. /home/jovyan
exec /bin/run.sh "$@"
