
package rest

import (
    "net/http"
    "github.com/julienschmidt/httprouter"
)

func Handler() http.Handler {
	router := httprouter.New()
	return router
}

