FROM caddy:2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/pteich/caddy-tlsconsul \
    --with github.com/kirsch33/realip

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
