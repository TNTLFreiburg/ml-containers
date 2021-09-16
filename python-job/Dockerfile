FROM cr.nail.science/ml-containers/conda:--TAG--

USER ${NB_UID}

# s6 - copy scripts
COPY --chown=jovyan:users s6/ /etc

USER ${NB_UID}

ENTRYPOINT ["/init"]
