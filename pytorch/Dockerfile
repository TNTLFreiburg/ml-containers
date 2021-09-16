FROM cr.nail.science/ml-containers/conda:--TAG--

# nvidia configs
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

# install - requirements.txt
COPY --chown=jovyan:users install.sh /tmp/install_torch.sh
RUN chmod +x /tmp/install_torch.sh && /tmp/install_torch.sh \
 && rm -f /tmp/install_torch.sh
