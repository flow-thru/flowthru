
package pg

import (
    "database/sql"
    _ "github.com/lib/pq"
)

type Storage interface {
    // methods
}

// DB is an embedded type that serves as an interface to the Postgres database.
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
