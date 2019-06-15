
package types

import (
    "github.com/graphql-go/graphql"
)

var User = graphql.NewObject(graphql.ObjectConfig {
    Name: "User",
    Fields: graphql.Fields{
        "name": &graphql.Field{
            Type: graphql.String,
        },
        "description": &graphql.Field{
            Type: graphql.String,
        },
    },
})
