#!/usr/bin/with-contenv bash
. /opt/conda/etc/profile.d/conda.sh

set -e

export CONDA_ENV=`cat /tmp/CONDA_ENV`

cd "${WORKDIR:-/work}"

echo "-----------------"
echo "Environment '${CONDA_ENV}'"
echo "Script '${SCRIPT:-python main.py}'"
echo "-----------------"

conda activate "${CONDA_ENV}"

eval "${SCRIPT:-python main.py}"
