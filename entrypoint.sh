#!/bin/bash
set -e

# Write cloudflared config using token passed as env var (never hardcode it)
if [ -n "$CLOUDFLARE_TUNNEL_TOKEN" ]; then
    cat > /etc/supervisor/conf.d/cloudflared-tunnel.conf << EOF
[program:cloudflared-tunnel]
command=cloudflared tunnel run --token ${CLOUDFLARE_TUNNEL_TOKEN}
autostart=true
autorestart=true
startretries=5
startsecs=10
stdout_logfile=/workspace/cloudflared-tunnel.log
stderr_logfile=/workspace/cloudflared-tunnel.err.log
EOF
fi

exec /usr/bin/supervisord -n -c /etc/supervisord.conf