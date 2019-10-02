
package rest

import (
    "net/http"
    "github.com/gorilla/mux"
)

func Handler() http.Handler {
	router := mux.NewRouter()
	return router
}

