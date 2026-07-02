# php81-apache

Immagine PHP 8.1 + Apache con moduli essenziali (mysqli, imagick, curl, xsl, opcache, rewrite...).

## Utilizzo

```bash
docker pull ghcr.io/redenfire/php81-apache:latest

docker run -p 8080:80 ghcr.io/redenfire/php81-apache:latest
```

Metti i tuoi file PHP in `/var/www/html/` (via volume o COPY nel Dockerfile).
