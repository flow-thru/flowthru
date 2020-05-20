package pg

import "github.com/flow-thru/flowthru/internal/models"

// GetUser is a method of type Database. It takes in a user ID and
// returns the user row corresponding to that ID.
func (db *Database) GetUser(userID int) (*models.User, error) {
	sqlStatement := `
	SELECT user_id, username 
	FROM users 
	WHERE user_id = $1`
	user := new(models.User)
	row := db.QueryRow(sqlStatement, userID)
	err := row.Scan(&user.ID, &user.Name)
	if err != nil {
		return nil, err
	}
	return user, nil
}

// InsertUser is a method of type Database. It takes in a new User and
// returns the user ID if the user was sucessfully inserted into the
// repository.
func (db *Database) InsertUser(user *models.User) (int, error) {
	sqlStatement := `
	INSERT INTO users (username)
	VALUES ($1)
	RETURNING user_id`
	id := 0
	err := db.QueryRow(sqlStatement, user.Name).Scan(&id)
	if err != nil {
		return -1, err
	}
	return id, nil
}
