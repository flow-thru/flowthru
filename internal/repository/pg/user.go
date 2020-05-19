package pg

import "github.com/flow-thru/flowthru/internal/models"

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
