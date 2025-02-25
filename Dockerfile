FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/mholt/caddy-dynamicdns \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/greenpau/caddy-security \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
