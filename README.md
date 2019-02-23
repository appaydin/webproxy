# Treafik Reverse Proxy

Documentation at [Traefik](https://docs.traefik.io/). Listens only port HTTP(80) and HTTPS(443). Connect our applications to the __webproxy__ network. Lets Encrypt certificate is automatically generated for Host Rule.

Traefik API Dashboard: IP:8000 - admin:123123

Add the certificates to the certs directory with the host name. Example:
```
certs/writeln.net.crt
certs/writeln.net.key
```

### Makefile Command:

```
run     => docker-compose up -d --remove-orphans
stop    => docker-compose stop
down    => docker-compose down
build   => docker-compose build
restart => docker-compose stop && docker-compose up -d --remove-orphans
```

### APP Example:
```yaml
version: '3'

services:
    app:
        ...
        labels:
            - traefik.enable=true
            - traefik.backend=writeln_website
            - traefik.frontend.rule=Host:writeln.net,www.writeln.net
            - traefik.frontend.headers.SSLRedirect=true
            - traefik.frontend.headers.SSLTemporaryRedirect=true
        networks: 
             - webproxy
             - default
```