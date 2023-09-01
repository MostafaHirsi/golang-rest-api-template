setup:
	go install github.com/swaggo/swag/cmd/swag@latest
	swag init

build:
	swag init
	docker compose up --build

up:
	swag init
	docker compose up

down:
	docker compose down

restart:
	swag init
	docker compose restart

clean:
	docker stop go-rest-api-template
	docker stop dockerPostgres
	docker rm go-rest-api-template
	docker rm dockerPostgres
	docker image rm go-rest-api-template
	rm -rf .dbdata
