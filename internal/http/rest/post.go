package rest

import (
	"encoding/json"
	"net/http"
	"strconv"

	"github.com/flow-thru/flowthru/internal/models"
)

func insertUser(repo UserRepository) func(w http.ResponseWriter, r *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		decoder := json.NewDecoder(r.Body)

		newUser := new(models.User)
		err := decoder.Decode(&newUser)
		if err != nil {
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}

		id, err := repo.InsertUser(newUser)
		if err != nil {
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}

		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode("New user with id " + strconv.Itoa(id) + " added.")
	}
}
