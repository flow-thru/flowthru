package main

import (
    "fmt"
    "log"
    "os"
    "net/http"
	"server/internal/http/rest"
	"server/internal/platform/database/pg"
)

var (
    DBCreds = fmt.Sprintf(
        "host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
        os.Getenv("FLOWTHRU_DB_HOST"),
        os.Getenv("FLOWTHRU_DB_PORT"),
        os.Getenv("FLOWTHRU_DB_USER"),
        os.Getenv("FLOWTHRU_DB_PASSWORD"),
        os.Getenv("FLOWTHRU_DB_NAME"),
    )
)


func main() {
    _, err := pg.NewDB(DBCreds)

    if err != nil {
        log.Fatal(err)
    }
    router := rest.Handler()
    http.Handle("/", router)
    fmt.Println("flowing thru at http://localhost:5000")
	log.Fatal(http.ListenAndServe(":5000", nil))
}

