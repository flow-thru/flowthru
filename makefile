# Database
database-build:
	- docker build internal/repository/pg -t flowthru-db;

database-run:
	- docker run -d --name flowthru-db -p 127.0.0.1:5432:5432 flowthru-db

database-stop:
	- docker stop flowthru-db

database-remove:
	- docker container rm -f flowthru-db; \
		docker rmi -f flowthru-db

# Backend
backend-dependencies:
	- go get -v -t -d ./...

backend-run:
	- go run cmd/main.go

backend-build:
	- cd cmd; \
		go build -o flowthru.out; \

backend-test:
	- go test -v ./...

# Web App
web-app-frontend-dependencies:
	- cd web-app; \
		npm install

web-app-run:
	- cd web-app; \
		npm start

web-app-build:
	- cd web-app; \
		npm build .

web-app-test:
	- cd web-app; \
		npm test