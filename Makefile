up:
	docker compose down
	docker compose up -d

down:
	docker compose down

restart:
	docker compose restart

re:
	docker compose down
	docker compose up --build -d

fclean:
	docker system prune -a --volumes

phony:	up down restart re fclean