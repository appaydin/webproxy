# Traefik Reverse Proxy

Documentation at [Traefik](https://docs.traefik.io/). Listens only port HTTP(80) and HTTPS(443). Connect our applications to the __webproxy__ network. 

Traefik API Dashboard: IP:8000 - admin:123123

Lets Encrypt certificate is automatically generated for Host Rule. To manually enter certificates, make the following change in the traefik.toml file:
```toml
# ---------------------------
# Entrypoints
# ---------------------------
[entryPoints]
  ...
    [entryPoints.https.tls]
      [[entryPoints.https.tls.certificates]]
        certFile = "/certs/example.com.crt"
        keyFile = "/certs/example.com.key"

# ---------------------------
# Lets Encrypt
# ---------------------------
[acme]
onHostRule = false
```
Add the certificates to the certs directory with the host name. Example:
```
certs/example.com.cert
certs/example.com.key
```

#### Makefile Command:

```bash
run     => docker-compose up -d --remove-orphans
stop    => docker-compose stop
down    => docker-compose down
build   => docker-compose build
restart => docker-compose stop && docker-compose up -d --remove-orphans
```

#### Application Example:
```yaml
version: '3'

services:
    app:
        ...
        # Traefik Configs
        labels:
            - traefik.enable=true
            - traefik.backend=app_backend
            - traefik.frontend.rule=Host:example.com, www.example.com
            - traefik.frontend.headers.SSLRedirect=true
            - traefik.frontend.headers.SSLTemporaryRedirect=true
        networks: 
             - webproxy
             - default
```