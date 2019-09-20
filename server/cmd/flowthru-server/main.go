package main

import (
    "fmt"
    "log"
    "os"
    "net/http"
	"server/pkg/http/rest"
	"server/pkg/storage/pg"
)


func main() {
    var DBCreds = fmt.Sprintf(
        "host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
        os.Getenv("FLOWTHRU_DB_HOST"),
        os.Getenv("FLOWTHRU_DB_PORT"),
        os.Getenv("FLOWTHRU_DB_USER"),
        os.Getenv("FLOWTHRU_DB_PASSWORD"),
        os.Getenv("FLOWTHRU_DB_NAME"),
    )
    _, err := pg.NewDB(DBCreds)

    if err != nil {
        log.Fatal(err)
    }
    router := rest.Handler()
    fmt.Println("flowing thru at http://localhost:5000")
	log.Fatal(http.ListenAndServe(":5000", router))
}

