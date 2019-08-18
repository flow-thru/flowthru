package main

import (
	"server/pkg/persistence/storage/json"
	"server/pkg/persistence/storage/sql"
	"server/pkg/http/rest"
)

func main() {
    router := rest.Handler(sample)
    fmt.Println("data is now flowing thru: http://localhost:3000")
	log.Fatal(http.ListenAndServe(":3000", router))
}

