#DATA_PATH = ./data 修正前
DATA_PATH = /home/ryomori/data

up:
	@mkdir -p ${DATA_PATH}/wordpress
	@mkdir -p ${DATA_PATH}/mariadb
	docker compose -f ./srcs/docker-compose.yml up --build

.PHONY: up