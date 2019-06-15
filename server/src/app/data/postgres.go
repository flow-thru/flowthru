package postgres

import (
	"database/sql"

	_ "github.com/lib/pq"
)

// DB is the database in use for testing purposes
var DB, err = sql.Open("postgres", "user=pqgotest password=1234 dbname=pqgotest sslmode=verify-full")
