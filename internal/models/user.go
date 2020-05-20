package models

// User is a entity that represents a user's account and data.
type User struct {
	ID   int
	Name string `json:"name"`
}
