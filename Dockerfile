FROM alpine:latest

RUN apk add --no-cache icecast && \
    mkdir -p /var/log/icecast && \
    chown -R icecast /var/log/icecast && \
    chown -R icecast /etc/icecast.xml

COPY icecast.xml /etc/icecast.xml

USER icecast

EXPOSE 8000

CMD ["icecast2", "-c", "/etc/icecast.xml"]
