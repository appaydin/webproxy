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
	docker-compose logs nginxproxy
conf:
	docker-compose exec nginxproxy cat /etc/nginx/conf.d/default.conf
reload:
	docker-compose exec nginxproxy nginx -s reload