package pg

import (
    testing
    os
    fmt
)
const var BDTestCreds := fmt.Sprintf(
    "host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
    os.Getenv("FLOWTHRU_TEST_DB_HOST"),
    os.Getenv("FLOWTHRU_TEST_DB_PORT"),
    os.Getenv("FLOWTHRU_TEST_DB_USER"),
    os.Getenv("FLOWTHRU_TEST_DB_PASSWORD"),
    os.Getenv("FLOWTHRU_TEST_DB_NAME")
)

// TestNewDB tests if a connections is correctly established.
// Additionally checks if a disconnection is completed without errors
func TestNewDB(t *testing.T) {
    db, err := NewDB(DBTestCreds)
    if err != nil {
        t.Fatalf(err)
    }
    err = db.Close()
    if err != nil {
        t.Fatalf(err)
    }
}

