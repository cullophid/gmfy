module Model where
import Dict exposing (Dict)
import Model.Game exposing (Game, emptyGame)
import Model.Activity exposing (Activity, emptyActivity)
import Model.User exposing (User)
import Util.Dict
import Json.Encode exposing (Value)
import Json.Decode exposing (Decoder, (:=))

type alias Model =
  { showActivityForm: Bool
  , gameForm : Game
  , activityForm : Activity
  , games : Dict String Game
  , location : String
  , user : User
  }

emptyModel : Model
emptyModel =
  { location  = "#home"
  , gameForm = emptyGame
  , activityForm = emptyActivity
  , games = Dict.empty
  , user =
    { id = "andreas"
    , name = "andreas"
    , email = "andreas.moller@gmail.com"
    }
  , showActivityForm = False
  }

encode : Model -> Value
encode model =
  Json.Encode.object [
    ("showActivityForm", Json.Encode.bool model.showActivityForm),
    ("gameForm", Model.Game.encode model.gameForm),
    ("activityForm", Model.Activity.encode model.activityForm),
    ("games", Util.Dict.encode Model.Game.encode model.games),
    ("location", Json.Encode.string model.location),
    ("user", Model.User.encode model.user)
  ]

decoder : Decoder Model
decoder =
  Json.Decode.object6
    Model
    ("showActivityForm" := Json.Decode.bool)
    ("gameForm" := Model.Game.decoder)
    ("activityForm" := Model.Activity.decoder)
    ("games" := Json.Decode.dict Model.Game.decoder)
    ("location" := Json.Decode.string)
    ("user" := Model.User.decoder)
