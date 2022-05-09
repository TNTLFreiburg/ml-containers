#!/bin/bash

echo "Populating home directory"
cp -r -n /tmp_home/* /home/

echo "Initializing conda"
. /opt/conda/etc/profile.d/conda.sh

set -e

conda activate base

WORK_PATH="${WORKDIR:-/work}"

export CONDA_ENV_PATH="${WORK_PATH}/${CONDA_FILE:-environment.yml}"
export PIP_REQUIREMENTS_PATH="${WORK_PATH}/${PIP_REQUIREMENTS:-requirements.txt}"

if [ -f "${CONDA_ENV_PATH}" ]; then
  mamba env create -f "${CONDA_ENV_PATH}"
  export ENV_NAME=`cat "${CONDA_ENV_PATH}" | grep 'name: ' | sed 's/name: \(.*\)/\1/'`
  echo "${ENV_NAME}" >> /tmp/CONDA_ENV
  conda activate "${ENV_NAME}"
else
  echo "base" >> /tmp/CONDA_ENV
fi

if [ -f "${PIP_REQUIREMENTS_PATH}" ]; then
  pip install -r "${PIP_REQUIREMENTS_PATH}"
fi

python -m ipykernel install --user --name 'job-kernel' || true

export CONDA_ENV=`cat /tmp/CONDA_ENV`

cd "${WORKDIR:-/work}"

echo "-----------------"
echo "Environment '${CONDA_ENV}'"
echo "-----------------"

conda activate "${CONDA_ENV}"

exec "$@"

echo "-----------------"
echo "Job finished"
echo "-----------------"

exit 0
