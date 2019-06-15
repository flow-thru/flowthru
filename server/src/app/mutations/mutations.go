
package mutations
import (
    "github.com/graphql-go/graphql"
    fields "github.com/flow-thru/flowthru/server/src/app/mutations/fields"
)

var RootMutation = graphql.NewObject(graphql.ObjectConfig{
    Name: "RootMutation",
    Fields: graphql.Fields{
        "createUser": fields.CreateUser,
    },
})
