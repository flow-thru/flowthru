## Dependencies
### Software
- [Go](https://golang.org/)
### Editors
These are not required, but recommended if you are unsure of what you are doing
- [VS Code](https://code.visualstudio.com/download)
- [Postman](https://www.getpostman.com/)

### Running the API

After you have [set up the databse](https://github.com/flow-thru/flowthru/tree/master/database/README.md), export the database credentials as environment variables

```
export FLOWTHRU_DB_HOST="localhost"
export FLOWTHRU_DB_PORT="5432"
export FLOWTHRU_DB_USER="user"
export FLOWTHRU_DB_PASSWORD="password"
export FLOWTHRU_DB_NAME="test"
```

To start the server application, run

```
go run cmd/flowthru-server/main.go
```

The server application will be running on http://localhost:5000

If you wish to run tests, first export the test database credentials as environment variables.
```
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
