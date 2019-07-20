package actions

import (
    "net/http"
    "net/http/httptest"
    "testing"
)

func TestGetHomeMessage(t *testing.T) {
    r, err := http.NewRequest("GET", "/", nil)
        if err != nil {
            t.Fatal(err)
    }

    w := httptest.NewRecorder()
    handler := http.HandlerFunc(getHomeMessage)
    handler.ServeHTTP(w, r)

    resp := w.Result()

    if resp.StatusCode != http.StatusOK {
         t.Errorf("Unexpected status code %d", resp.StatusCode)
    }
}
