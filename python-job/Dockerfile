FROM cr.nail.science/ml-containers/conda:--TAG--

USER ${NB_UID}

COPY --chown=jovyan:users exec-with-env.sh /init

USER ${NB_UID}

ENTRYPOINT ["/init"]
