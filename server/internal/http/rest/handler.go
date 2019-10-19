
package rest

import (
    "net/http"
    "encoding/json"

    "server/internal/platform/auth"

    "github.com/gorilla/mux"
)

// Hander deals with what string maps to which function, resulting in the
// creation of endpoints.
// It takes in services that it will leverage to create the endpoints.
// It returns an http.Handler to serve the endpoints.
// Example use:
//     router := Handler(service)
//     http.Handle("/", router
func Handler(authmw auth.Middleware) http.Handler {
	router := mux.NewRouter()
	router.Handle("/private/test", authmw.RequireLogin(privateTest()))
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

// privateTest is utilized for the authentication example.
func privateTest() http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode("Hello from a private endpoint!")
    }
}
