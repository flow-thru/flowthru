package queries

import (
	postgres "github.com/flow-thru/flowthru/server/src/app/data"
	types "github.com/flow-thru/flowthru/server/src/app/types"
	"github.com/graphql-go/graphql"
)

type userStruct struct {
	NAME        string `json:"name"`
	DESCRIPTION string `json:"description"`
}

var GetUsers = &graphql.Field{
	Type:        graphql.NewList(types.User),
	Description: "Get all users",
	Resolve: func(params graphql.ResolveParams) (interface{}, error) {

		rows, err := postgres.DB.Query("SELECT * FROM users")

		if err != nil {
			panic(err)
		}

		var userList []userStruct

		for rows.Next() {
			user := userStruct{}
			var name string
			var description string
			if err := rows.Scan(&name, &description); err != nil {
				panic(err)
			}
			user.NAME = name
			user.DESCRIPTION = description
			userList = append(userList, user)
		}

		return userList, nil
	},
}
