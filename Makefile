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
	sudo docker-compose stop
	sudo docker-compose up -d --remove-orphans