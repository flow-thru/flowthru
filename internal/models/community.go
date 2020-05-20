package models

// Community is an entity representing a group of users.
type Community struct {
	ID      int
	OwnerID int
	Name    string
}
