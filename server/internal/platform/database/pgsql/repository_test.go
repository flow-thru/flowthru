package pgsql

import (
    "testing"
    "os"
    "fmt"
)


var DBTestCreds = fmt.Sprintf(
    "host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
    os.Getenv("FLOWTHRU_TEST_DB_HOST"),
    os.Getenv("FLOWTHRU_TEST_DB_PORT"),
    os.Getenv("FLOWTHRU_TEST_DB_USER"),
    os.Getenv("FLOWTHRU_TEST_DB_PASSWORD"),
    os.Getenv("FLOWTHRU_TEST_DB_NAME"),
)

// TestNewDB tests if a connections is correctly established.
// Additionally checks if a disconnection is completed without errors
func TestNewDB(t *testing.T) {
    db, err := NewDB(DBTestCreds)
    if err != nil {
        t.Fatalf("Error when connecting to database: %q", err.Error())
    }
    err = db.Close()
    if err != nil {
        t.Fatalf("Error when closing connection to database: %q", err.Error())
    }
}

