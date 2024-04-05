setup:
	go install github.com/swaggo/swag/cmd/swag@latest
	swag init
	go build -o bin/server cmd/server/main.go

build:
	docker compose build --no-cache

up:
	docker compose up --detach

swag:
	docker run -p 80:8080 -e SWAGGER_JSON=/mnt/swagger.json -v /docs:/mnt  swaggerapi/swagger-ui

push-swag:
	scp -i ed-key.pem docs/docs.go docs/swagger.json docs/swagger.yaml ec2-user@54.173.37.111:/home/ec2-user/golang-rest-api-template/docs

push-build:
	scp -i ed-key.pem bin/server ec2-user@54.173.37.111:/home/ec2-user/golang-rest-api-template/bin
	scp -i ed-key.pem Dockerfile ec2-user@54.173.37.111:/home/ec2-user/golang-rest-api-template/
	scp -i ed-key.pem docker-compose.yml ec2-user@54.173.37.111:/home/ec2-user/golang-rest-api-template/

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
