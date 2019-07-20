package actions

import (
	"encoding/json"
	"net/http"
)


func getHomeMessage(w http.ResponseWriter, r *http.Request) {
    json.NewEncoder(w).Encode(map[string]string{"message": "coming soon"})
}
