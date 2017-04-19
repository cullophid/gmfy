module User exposing (User, userDecoder, andreas)
import Json.Decode exposing (Decoder, map3, field, string)

type alias User = {
  email : String,
  firstName : String,
  lastName : String
  }

andreas: User
andreas = {
  email = "andreas.moller@gmail.com",
  firstName = "Andreas",
  lastName = "Møller"
  }

userDecoder : Decoder User
userDecoder = map3 User
  (field "email" string)
  (field "firstName" string)
  (field "lastName" string)
