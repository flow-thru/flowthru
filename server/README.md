## Dependencies
- [Go](https://golang.org/)
- [Postman](https://www.getpostman.com/) (optional)

### Running the Backend

After you have [set up the databse](https://github.com/flow-thru/flowthru/tree/master/database/README.md), export the database credentials as environment variables

```bash
export FLOWTHRU_DB_HOST="localhost"
export FLOWTHRU_DB_PORT="5432"
export FLOWTHRU_DB_USER="user"
export FLOWTHRU_DB_PASSWORD="password"
export FLOWTHRU_DB_NAME="test"
```

Auth0 is utilized to authenticate users. Visit the [Auth0](http://auth0.com) website to create a free account and obtain a domain and an API identifier. View instructions [here](https://auth0.com/docs/apis). Then export them as environment variables as detailed below.  

```bash
export FLOWTHRU_AUTH0_DOMAIN="{YOUR AUTH0 DOMAIN}"
export FLOWTHRU_API_IDENTIFIER="{YOUR AUTH0 API IDENTIFIER}"
```

To learn more about Auth0 in golang, please visit [Auth0's Golang documentation](https://auth0.com/docs/quickstart/webapp/golang)  


To start the server application, run

```
go run cmd/server/main.go
```

The server application will be running on http://localhost:5000

If you wish to run tests, first export the test database credentials as environment variables.

```bash
export FLOWTHRU_TEST_DB_HOST="localhost"
export FLOWTHRU_TEST_DB_PORT="5432"
export FLOWTHRU_TEST_DB_USER="user"
export FLOWTHRU_TEST_DB_PASSWORD="password"
export FLOWTHRU_TEST_DB_NAME="test"
```

You can then test the application using the command

```
go test -v ./...
```
