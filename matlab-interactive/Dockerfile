FROM mathworks/matlab:r2021a

USER root

RUN sed -i 's/--vnc/--listen 8888 --vnc/' /bin/run.sh \
  && sed -i 's@localhost:5901 > /dev/null 2>&1@localhost:5901@' /bin/run.sh \
  && sed -i 's@-localhost no > /dev/null 2>&1@-localhost no@' /bin/run.sh \
  && groupadd -g 1337 istio \
  && cp -r /home/matlab /tmp_home && chown -R matlab:matlab /tmp_home \
  && mkdir -p /home/jovyan && chown -R matlab:matlab /home/jovyan \
  && usermod -d /home/jovyan matlab && chown matlab:matlab /opt/noVNC/

COPY --chown=matlab:matlab entrypoint.sh /
COPY --chown=matlab:matlab redirect.html /opt/noVNC/redirect.html

USER matlab

EXPOSE 8888

ENTRYPOINT ["/entrypoint.sh"]
CMD ["-vnc"]
