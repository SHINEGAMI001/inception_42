up:
	docker compose -f srcs/docker-compose.yaml down
	docker compose -f srcs/docker-compose.yaml up -d

down:
	docker compose -f srcs/docker-compose.yaml down

restart:
	docker compose -f srcs/docker-compose.yaml restart

re:
	docker compose -f srcs/docker-compose.yaml down
	docker compose -f srcs/docker-compose.yaml up --build -d

fclean:
	docker system prune -a --volumes

phony:	up down restart re fclean