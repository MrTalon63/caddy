FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security \
    --with github.com/gamalan/caddy-tlsredis \
    --with github.com/ueffel/caddy-brotli \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/mholt/caddy-dynamicdns \
    --with github.com/caddy-dns/cloudflare

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
