
package queries

import (
    "github.com/graphql-go/graphql"
    fields "github.com/flow-thru/flowthru/server/src/app/queries/fields"
)

var RootQuery = graphql.NewObject(graphql.ObjectConfig{
    Name: "RootQuery",
    Fields: graphql.Fields{
        "getUsers": fields.GetUsers,
    },
})
