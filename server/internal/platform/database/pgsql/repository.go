
package pgsql

import (
    "database/sql"
    _ "github.com/lib/pq"
)

// Database is an embedded type that serves as a connection to the Postgres database.
type Database struct {
    *sql.DB
}

// NewDB opens a connections to the Postgres database.
// It returns a pointer to the connection, otherwise it returns an error that was encountered.
func NewDB(credentials string) (*Database, error) {
    db, err := sql.Open("postgres", credentials)
    if err != nil {
        return nil, err
    }
    if err = db.Ping(); err != nil {
        return nil, err
    }
    return &Database{db}, nil
}

