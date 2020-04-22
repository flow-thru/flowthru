
package rest

import (
    "net/http"
    "encoding/json"

    "github.com/gorilla/mux"
)

// Hander deals with what string maps to which function, resulting in the
// creation of endpoints.
// It returns an http.Handler to serve the endpoints.
// Example use:
//     router := Handler()
//     http.Handle("/", router
func Handler() http.Handler {
	router := mux.NewRouter()
	router.Handle("/public/test", publicTest())
	return router
}

// publicTest is utilized for the authentication example.
func publicTest() http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode("Hello from a public endpoint!")
    }
}
