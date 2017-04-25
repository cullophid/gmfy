module User.Api exposing (..)

import GraphQL.Request.Builder exposing (..)
import User.Data exposing (User)

user : ValueSpec NonNull ObjectType User vars
user = object User
  |> with (field "id" [] string)
  |> with (field "email" [] string)
  |> with (field "firstName" [] string)
  |> with (field "lastName" [] string)
