FROM oryd/kratos:v0.7.1-alpha.1

USER root
RUN apk add gettext

COPY --chown=ory:ory entrypoint.sh /
RUN chmod +x /entrypoint.sh

COPY kratos /home/ory
RUN chown -R ory:ory /home/ory

USER ory
ENTRYPOINT ["/entrypoint.sh"]

CMD ["serve"]