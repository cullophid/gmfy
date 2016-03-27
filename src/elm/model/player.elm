module Model.Player where
import Json.Encode exposing (Value)
import Json.Decode exposing (Decoder, (:=))

type alias Player =
  { id : String
  , name : String
  , email : String
  , score : Int
  }

emptyPlayer : Player
emptyPlayer =
  { id = ""
  , name = ""
  , email = ""
  , score = 0
  }


encode : Player -> Value
encode player =
  Json.Encode.object [
    ("id", Json.Encode.string player.id),
    ("name", Json.Encode.string player.name),
    ("email", Json.Encode.string player.name),
    ("score", Json.Encode.int player.score)
  ]


decoder : Decoder Player
decoder =
  Json.Decode.object4
    Player
    ("id" := Json.Decode.string)
    ("name" := Json.Decode.string)
    ("email" := Json.Decode.string)
    ("score" := Json.Decode.int)
