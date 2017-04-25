module User exposing (..)

import GraphQL.Request.Builder exposing (..)
import Json.Decode as Decode exposing (Decoder)

userDecoder : Decoder User
userDecoder =
  Decode.map4 User
    (Decode.field "id" Decode.string)
    (Decode.field "email" Decode.string)
    (Decode.field "firstName" Decode.string)
    (Decode.field "lastName" Decode.string)


userSpec : ValueSpec NonNull ObjectType User vars
userSpec = object User
  |> with (field "id" [] string)
  |> with (field "email" [] string)
  |> with (field "firstName" [] string)
  |> with (field "lastName" [] string)

type alias User = {
  id: String,
  email : String,
  firstName : String,
  lastName : String
  }

andreas: User
andreas = {
  id = "ab9e86fb-2b5d-47b5-a4cf-5f0c8696c33b",
  email = "andreas.moller@gmail.com",
  firstName = "Andreas",
  lastName = "Møller"
  }
