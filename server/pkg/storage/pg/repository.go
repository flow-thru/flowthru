
package pg

import (
    "database/sql"
    _ "github.com/lib/pq"
)

// Storage is an interface type to implement the following methods
// Serves for the creation of mock databases for unit testing.
type Storage interface {
    AllOrganizations() ([]*Organization, error)
}

// DB is an embedded type that serves as a connection to the Postgres database.
type DB struct {
    *sql.DB
}

// NewDB opens a connections to the Postgres database
// It returns a pointer to the connection, otherwise it returns an error that was encountered.
func NewDB(credentials string) (*DB, error) {
    db, eer := sql.Open("postgres", credentials)
    if eer != nil {
        return nil, eer
    }
    if eer = db.Ping(); eer != nil {
        return nil, eer
    }
    return &DB{db}, nil
}
