package main

import (
    "fmt"
    "log"
    "net/http"
	"server/pkg/http/rest"
)

func main() {
    router := rest.Handler()
    fmt.Println("data is now flowing thru: http://localhost:3000")
	log.Fatal(http.ListenAndServe(":3000", router))
}

