# Nginx Reverse Proxy

Documentation at [Docker Hub Repository]([https://link](https://hub.docker.com/r/jwilder/nginx-proxy)). Listens only port HTTP(80) and HTTPS(443). Connect our applications to the __webproxy__ network.

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

log     => View nginx stdout log
conf    => View nginx default.conf
reload  => Reload nginx
```

### APP Example:
```yaml
version: '2'

services:
    app:
        ...
        # ports:
        #     - 80
        environment:
            - VIRTUAL_HOST=writeln.net
            #- CERT_NAME=*.writeln.net
        networks: 
             - webproxy
             - default
```