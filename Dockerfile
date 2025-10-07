# Usar Alpine Linux base
FROM alpine:latest

# Instalar Icecast
RUN apk add --no-cache icecast

# Criar pasta de logs e dar permissão ao usuário icecast
RUN mkdir -p /var/log/icecast && \
    chown -R icecast:icecast /var/log/icecast && \
    chown -R icecast:icecast /etc/icecast.xml

# Copiar seu arquivo de configuração para o container
COPY icecast.xml /etc/icecast.xml

# Rodar o Icecast com usuário não-root
USER icecast

# Expor a porta padrão do Icecast
EXPOSE 8000

# Comando para iniciar o Icecast
CMD ["icecast2", "-c", "/etc/icecast.xml"]
