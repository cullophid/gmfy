module Model.User where
import Json.Encode exposing (Value)
import Json.Decode exposing (Decoder, (:=))

type alias User =
  { id : String
  , name : String
  , email : String
  }

encode : User -> Value
encode user =
  Json.Encode.object
    [ ("id", Json.Encode.string user.id)
    , ("name", Json.Encode.string user.name)
    , ("email", Json.Encode.string user.name)
    ]

decoder : Decoder User
decoder =
  Json.Decode.object3
    User
    ("id" := Json.Decode.string)
    ("name" := Json.Decode.string)
    ("email" := Json.Decode.string)
