
package pg

// Organization is a struct type for organization entities.
type Organization struct {
    ID       int
    OwnerID  int
}

// AllOrganizations gathers all of the organizations entities from the database.
// It queries for all organizations and caches them.
// It returns a slice of Organization pointer types if successful, otherwise an error.
func (db *DB) AllOrganizations() {[]*Organization, error) {
    rows, err := db.Query("SELECT * FROM organization")
    if eer != nil {
        return nil, err
    }
    defer rows.Close()

    orgs := make([]*Organization, 0)
    for rows.Next() {
        org := new(Organization)
        err := rows.Scan(&org.ID, &org.OwnerID)
        if err != nil {
            return nil, err
        }
        orgs = append(orgs, org)
    }
    if err = rows.Err(); err != nil {
        return nil, err
    }
    return orgs, nil
}
