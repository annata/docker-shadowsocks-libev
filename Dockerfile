FROM debian:stretch
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh && apt-get update && apt-get install -y shadowsocks-libev && rm -rf /var/lib/apt/lists/*
CMD ["/docker-entrypoint.sh"]