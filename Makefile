setup:
	go install github.com/swaggo/swag/cmd/swag@latest
	swag init
	go build -o bin/server cmd/server/main.go

build:
	docker compose build --no-cache

up:
	docker compose up

swag:
	docker run -p 80:8080 -e SWAGGER_JSON=/mnt/swagger.json -v /Users/mostafahirsi/Documents/github_projects/golang-rest-api-template/docs:/mnt  swaggerapi/swagger-ui

down:
	docker compose down

restart:
	docker compose restart

clean:
	docker stop go-rest-api-template
	docker stop dockerPostgres
	docker rm go-rest-api-template
	docker rm dockerPostgres
	docker rm dockerRedis
	docker image rm golang-rest-api-template-backend
	rm -rf .dbdata
