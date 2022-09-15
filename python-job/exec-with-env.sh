#!/bin/bash

echo "Populating home directory"
cp -r -n /tmp_home/* /home/

echo "Initializing conda"
. /opt/conda/etc/profile.d/conda.sh

set -e

conda activate base

WORK_PATH="${WORKDIR:-/work}"

if [ -z ${CONDA_ENV_PATH+x} ]; then
  export CONDA_ENV_PATH="${WORK_PATH}/${CONDA_FILE:-environment.yml}"
fi

if [ -z ${PIP_REQUIREMENTS_PATH+x} ]; then
  export PIP_REQUIREMENTS_PATH="${WORK_PATH}/${PIP_REQUIREMENTS:-requirements.txt}"
fi

if [ -f "${CONDA_ENV_PATH}" ]; then
  cp "${CONDA_ENV_PATH}" /tmp/conda-environment.yml
  mamba env create -f /tmp/conda-environment.yml
  export ENV_NAME=`cat "${CONDA_ENV_PATH}" | grep 'name: ' | sed 's/name: \(.*\)/\1/'`
  echo "${ENV_NAME}" >> /tmp/CONDA_ENV
  conda activate "${ENV_NAME}"
else
  echo "No conda environment definition at ${CONDA_ENV_PATH}"
  echo "base" >> /tmp/CONDA_ENV
fi

if [ -f "${PIP_REQUIREMENTS_PATH}" ]; then
  pip install -r "${PIP_REQUIREMENTS_PATH}"
else
  echo "No pip requirements at ${PIP_REQUIREMENTS_PATH}"
fi

python -m ipykernel install --user --name 'job-kernel' || true

export CONDA_ENV=`cat /tmp/CONDA_ENV`

cd "${WORKDIR:-/work}"

echo "-----------------"
echo "Environment '${CONDA_ENV}'"
echo "-----------------"

cd "${WORK_PATH}"
conda activate "${CONDA_ENV}"

exec "$@"

echo "-----------------"
echo "Job finished"
echo "-----------------"

exit 0
