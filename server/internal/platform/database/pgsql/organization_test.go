
package pgsql

import (
    "testing"
)

// TestOwnersOrganizations tests if at least one organization is retrieved for owner ID of 1
func TestOwnersOrganizations(t *testing.T) {
    ownerId := 1

    db, err := NewDB(DBTestCreds)
    if err != nil {
        t.Fatalf("Recieved error when connecting to database: %q\n", err.Error())
    }
    orgs, err := db.OwnersOrganizations(ownerId)
    if err != nil {
        t.Fatalf("Recieved error when querying for owner's organization: %q\n", err.Error())
    }
    numRows := len(orgs)
    if numRows < 1 {
        t.Fatalf("Recieved %d owned organizations for user ID %d; should be >= 1.", numRows, ownerId)
    }
}

