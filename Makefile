DATA_PATH = ./data

up:
	@mkdir -p ${DATA_PATH}/wordpress
	@mkdir -p ${DATA_PATH}/mariadb
	docker compose up --build

.PHONY: up