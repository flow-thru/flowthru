
package rest

import (
    "encoding/json"
    "fmt"
    "net/http"
    "strconv"
    "server/pkg/listing"
)

func Handler(l listing.Service) http.Handler {
	router := httprouter.New()
	router.GET("/samplemessage/:id", getSampleMessage(l))
	return router
}

// Returns a handler for GET /samplemessage/:id requests
func getSampleMessage(s listing.Service) func(w http.ResponseWriter, r *http.Request, p httprouter.Params) {
	return func(w http.ResponseWriter, r *http.Request, p httprouter.Params) {
		ID, err := strconv.Atoi(p.ByName("id"))
		if err != nil {
			http.Error(w, fmt.Sprintf("%s is not a valid sample message ID, it must be a number.", p.ByName("id")), http.StatusBadRequest)
			return
		}

		SampleMessage, err := s.GetSampleMessage(ID)
		if err == listing.ErrNotFound {
			http.Error(w, "The sample message you requested does not exist.", http.StatusNotFound)
			return
		}

		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(beer)
	}
}
