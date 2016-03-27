module Model.Game where
import Dict exposing (Dict)
import Model.Player exposing (Player)
import Model.Activity exposing (Activity)
import Json.Encode exposing (Value)
import Json.Decode exposing (Decoder, (:=))
import Util.Dict

type alias Game =
  { id : String
  , title : String
  , description : String
  , activities : Dict String Activity
  , players: Dict String Player
  }

emptyGame : Game
emptyGame =
  { id = ""
  , title = ""
  , description = ""
  , activities = Dict.empty
  , players = Dict.empty
  }

encode : Game -> Value
encode game =
  Json.Encode.object [
    ("id", Json.Encode.string game.id),
    ("title", Json.Encode.string game.title),
    ("description", Json.Encode.string game.description),
    ("activities", Util.Dict.encode Model.Activity.encode game.activities),
    ("players", Util.Dict.encode Model.Player.encode game.players)
  ]

decoder : Decoder Game
decoder =
  Json.Decode.object5
    Game
    ("id" := Json.Decode.string)
    ("title" := Json.Decode.string)
    ("description" := Json.Decode.string)
    ("activities" := Json.Decode.dict Model.Activity.decoder)
    ("players" := Json.Decode.dict Model.Player.decoder)
