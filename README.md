# Derper
![docker workflow](https://github.com/fredliang44/derper-docker/actions/workflows/docker-image.yml/badge.svg) 
![platfrom](https://img.shields.io/badge/platform-amd64%20%7C%20arm64-brightgreen)

Forked from fredliang44/derper-docker

# Setup

```bash
docker run -p 80:80 -p 443:443 -p 3478:3478 refunc/derper --hostname your-hostname.com --certmode letsencrypt --certdir /app/certs  --a :443 --stun true
```

# Usage

Fully DERP setup offical documentation: https://tailscale.com/kb/1118/custom-derp-servers/
