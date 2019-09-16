package main

import (
    "fmt"
    "log"
    "net/http"
	"server/pkg/http/rest"
)

func main() {
    router := rest.Handler()
    fmt.Println("flowing thru at http://localhost:5000")
	log.Fatal(http.ListenAndServe(":5000", router))
}

