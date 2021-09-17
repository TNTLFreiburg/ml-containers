#!/bin/bash
. /opt/conda/etc/profile.d/conda.sh

# renovate: datasource=github-tags depName=pytorch/torch versioning=loose
export TORCH_VERSION=1.9.0
# renovate: datasource=github-tags depName=pytorch/vision versioning=loose
export TORCHVISION_VERSION=0.10.0
# renovate: datasource=github-tags depName=pytorch/vision versioning=loose
export TORCHAUDIO_VERSION=0.9.0

export CUDA_VERSION=11.1
export CONDA_PKGS_DIR=/opt/conda/pkgs

mamba install -c pytorch -c nvidia \
  pytorch="${TORCH_VERSION}" \
  torchvision="${TORCHVISION_VERSION}" \
  torchaudio="${TORCHAUDIO_VERSION}" \
  cudatoolkit="${CUDA_VERSION}"
mamba clean -p -t -y
