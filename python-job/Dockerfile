FROM cr.nail.science/ml-containers/conda:--TAG--

USER ${NB_UID}

# Exit when init stage fails
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

# s6 - copy scripts
COPY --chown=jovyan:users s6/ /etc

COPY --chown=jovyan:users exec-with-env.sh /bin

USER ${NB_UID}

ENTRYPOINT ["/init"]
CMD ["/bin/exec-with-env.sh"]
