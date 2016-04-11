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

type alias JsonGame =
  { id : String
  , title : String
  , description : String
  , activities : List (String, Activity)
  , players: List (String, Player)
  }

emptyGame : Game
emptyGame =
  { id = ""
  , title = ""
  , description = ""
  , activities = Dict.empty
  , players = Dict.empty
  }

toJson game =
  { id = game.id
  , title = game.title
  , description = game.description
  , activities = Dict.toList game.activities
  , players = Dict.toList game.players
  }

fromJson data =
  { id = data.id
  , title = data.title
  , description = data.description
  , activities = Dict.fromList data.activities
  , players = Dict.fromList data.players
  }
