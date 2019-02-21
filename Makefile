# ------------------------------------
# Docker Process
# ------------------------------------
run:
	sudo docker-compose up -d --remove-orphans
stop:
	sudo docker-compose stop
down:
	sudo docker-compose down
build:
	sudo docker-compose build
restart:
	sudo docker-compose stop && docker-compose up -d --remove-orphans

# ------------------------------------
# Container Actions
# ------------------------------------
log:
	sudo docker-compose logs nginxproxy
conf:
	sudo docker-compose exec nginxproxy cat /etc/nginx/conf.d/default.conf
reload:
	sudo docker-compose exec nginxproxy nginx -s reload