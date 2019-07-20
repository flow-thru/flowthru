package actions

import (
	"log"
	"net/http"
)

func App() {
    http.HandleFunc("/", getHomeMessage)
    log.Fatal(http.ListenAndServe(":3000", nil))
}

