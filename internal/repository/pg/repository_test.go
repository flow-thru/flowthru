package pg

import (
    "testing"
    "os"
    "fmt"
)

// TestNewDB tests if a connections is correctly established.
// Additionally checks if a disconnection is completed without errors
func TestNewDB(t *testing.T) {
    db, err := NewDB(
            "host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
            os.Getenv("FLOWTHRU_DB_HOST"),
            os.Getenv("FLOWTHRU_DB_PORT"),
            os.Getenv("FLOWTHRU_DB_USER"),
            os.Getenv("FLOWTHRU_DB_PASSWORD"),
            os.Getenv("FLOWTHRU_DB_NAME"))))
    if err != nil {
        t.Fatalf("Error when connecting to database: %q", err.Error())
    }

    err = db.Close()
    if err != nil {
        t.Fatalf("Error when closing connection to database: %q", err.Error())
    }
}

