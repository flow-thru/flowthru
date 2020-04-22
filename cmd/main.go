package main

import (
    "fmt"
    "log"
    "os"
    "net/http"
    "github.com/joho/godotenv"
	"github.com/flow-thru/flowthru/internal/http/rest"
	"github.com/flow-thru/flowthru/internal/repository/pg"
	"github.com/flow-thru/flowthru/internal/middleware/auth"
)

func init() {
    // If an environment variable is already defined, Go will prefer that
    // instead of the value set in .env.
    if err :=godotenv.Load(); err != nil {
        log.Print("No .env file found")
    }
}

func main() {
    _, err := pgsql.NewDB(
        fmt.Sprintf(
            "host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
            os.Getenv("FLOWTHRU_DB_HOST"),
            os.Getenv("FLOWTHRU_DB_PORT"),
            os.Getenv("FLOWTHRU_DB_USER"),
            os.Getenv("FLOWTHRU_DB_PASSWORD"),
            os.Getenv("FLOWTHRU_DB_NAME")))
    if err != nil {
        log.Fatal(err)
    }

    router := rest.Handler()
    http.Handle("/", router)
    fmt.Println("flowing thru at http://localhost:5000")
	log.Fatal(http.ListenAndServe(":5000", nil))
}

