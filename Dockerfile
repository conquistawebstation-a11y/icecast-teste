FROM alpine:latest

# Instala o Icecast
RUN apk add --no-cache icecast && \
    mkdir -p /var/log/icecast && \
    chown -R icecast /var/log/icecast && \
    chown -R icecast /etc/icecast.xml

# Define o usuário 'icecast' que já existe
USER icecast

# Expõe a porta 8000 para o Icecast
EXPOSE 8000

# Copia o arquivo de configuração
COPY icecast.xml /etc/icecast.xml

# Comando para rodar o Icecast com o arquivo de configuração
CMD ["icecast2", "-c", "/etc/icecast.xml"]
