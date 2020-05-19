package rest

import (
	"github.com/flow-thru/flowthru/internal/models"
	"github.com/gorilla/mux"
)

type UserRepository interface {
	GetUser(int) (*models.User, error)
	InsertUser(*models.User) (int, error)
}

// UserHandler deals with what string maps to which function, resulting in the
// creation of endpoints.
// It returns an http.Handler to serve the endpoints.
// Example use:
//     router := Handler()
//     http.Handle("/", router)
func UserHandler(repo UserRepository) *mux.Router {

	userRouter := mux.NewRouter()

	postUserRouter := userRouter.PathPrefix("/user").Methods("POST").Subrouter()
	postUserRouter.HandleFunc("", insertUser(repo))

	getUserRouter := userRouter.PathPrefix("/user").Methods("GET").Subrouter()
	getUserRouter.HandleFunc("/{id:[0-9]+}", getUser(repo))

	return userRouter
}
