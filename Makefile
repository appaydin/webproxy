# ------------------------------------
# Docker Process
# ------------------------------------
run:
	docker-compose up -d --remove-orphans
stop:
	docker-compose stop
down:
	docker-compose down
build:
	docker-compose build
restart:
	docker-compose stop && docker-compose up -d --remove-orphans

# ------------------------------------
# Container Actions
# ------------------------------------
log:
	docker-compose logs webproxy
conf:
	docker-compose exec webproxy cat /etc/nginx/conf.d/default.conf
reload:
	docker-compose exec webproxy nginx -s reload