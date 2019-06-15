
package mutations

import (
    "github.com/graphql-go/graphql"
    "github.com/flow-thru/flowthru/server/src/app/data"
    types "github.com/flow-thru/flowthru/server/src/app/types"
)

type userStruct struct {
  NAME   string `json:"name"`
  DESCRIPTION   string `json:"description"`
}

var CreateUser = &graphql.Field {
    Type:        types.User,
    Description: "Create a User",
    Args: graphql.FieldConfigArgument{
        "name": &graphql.ArgumentConfig{
        Type: graphql.String,
        },
        "description": &graphql.ArgumentConfig{
        Type: graphql.String,
        },
    },
    
    Resolve: func(params graphql.ResolveParams) (interface{}, error) {
        
        // get our params
        name, _ := params.Args["name"].(string)
        description, _ := params.Args["description"].(string)
        _, err := postgres.DB.Query("INSERT INTO users(name, description) VALUES($1, $2)", name, description)
        if err != nil { panic(err) }
        return userStruct{name, description}, nil
    },
}
