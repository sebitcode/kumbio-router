FROM traefik:3.0
RUN mkdir -p /etc/traefik/acme \
    && touch /etc/traefik/acme/acme.json \
    && chmod 600 /etc/traefik/acme/acme.json
COPY ../../../roberto/staging/traefik/config.yml /etc/traefik