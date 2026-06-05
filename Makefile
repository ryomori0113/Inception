DATA_PATH = /home/ryomori/data

# デフォルトのルールを 'all' に設定
all: up

up:
	@mkdir -p ${DATA_PATH}/wordpress
	@mkdir -p ${DATA_PATH}/mariadb
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

clean: down
	docker compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	rm -rf ${DATA_PATH}/wordpress/*
	rm -rf ${DATA_PATH}/mariadb/*
	docker system prune -af

re: fclean all

.PHONY: all up down clean fclean re