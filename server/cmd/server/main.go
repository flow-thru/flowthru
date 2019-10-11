package main

import (
    "fmt"
    "log"
    "os"
    "net/http"
	"server/internal/http/rest"
	"server/internal/platform/database/pgsql"
	"server/internal/platform/auth"
)

var (
    pgsqlCreds = fmt.Sprintf(
        "host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
        os.Getenv("FLOWTHRU_DB_HOST"),
        os.Getenv("FLOWTHRU_DB_PORT"),
        os.Getenv("FLOWTHRU_DB_USER"),
        os.Getenv("FLOWTHRU_DB_PASSWORD"),
        os.Getenv("FLOWTHRU_DB_NAME"))
    auth0Domain = os.Getenv("FLOWTHRU_AUTH0_DOMAIN")
    auth0Audience = os.Getenv("FLOWTHRU_API_IDENTIFIER")
)

func main() {
    _, err := pgsql.NewDB(pgsqlCreds)
    if err != nil {
        log.Fatal(err)
    }
    userAuth := auth.NewUserAuth(auth0Domain, auth0Audience)
    router := rest.Handler(userAuth)
    http.Handle("/", router)
    fmt.Println("flowing thru at http://localhost:5000")
	log.Fatal(http.ListenAndServe(":5000", nil))
}

