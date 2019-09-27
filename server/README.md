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

Auth0 is utilized to authenticate users. For security purposes, you are required to create your own Auth0 account at auth0.com and export the following credentials in order to run the server application.

```bash
export FLOWTHRU_AUTH0_CLIENT_ID=CLIENT_ID                          # Replace with your auth0 client ID
export FLOWTHRU_AUTH0_DOMAIN=DOMAIN                                # Replace with your auth0 domain
export FLOWTHRU_AUTH0_CLIENT_SECRET=CLIENT_SECRET                  # Replace with your auth0 secret client ID
export FLOWTHRU_AUTH0_CALLBACK_URL=http://localhost:3000/callback
```

To learn more about Auth0 in golang, please visit [Auth0's Golang documentation](https://auth0.com/docs/quickstart/webapp/golang)  

Lastly, export a session key for sessions. You can use Go's [crypto/rand](https://play.golang.org/p/ZgvycIYxqt) package to gerenate a key  

```bash
export FLOWTHRU_SESSION_KEY=SUPER_SECRET_KEY        # Replace with you generated key
```

To start the server application, run

```
go run cmd/flowthru-server/main.go
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
