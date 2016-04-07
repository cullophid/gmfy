module Model where
import Dict exposing (Dict)
import Model.Game exposing (Game, emptyGame)
import Model.Page exposing (Page)
import Model.Activity exposing (Activity, emptyActivity)
import Model.User exposing (User)
import Util.Dict
import Json.Encode exposing (Value)
import Json.Decode exposing (Decoder, (:=))

type alias Model =
  { gameForm : Game
  , activityForm : Activity
  , games : Dict String Game
  , page : Page
  , url : String
  , user : User
  }

emptyModel : Model
emptyModel =
  { page  = Model.Page.Home
  , url = "#/"
  , gameForm = emptyGame
  , activityForm = emptyActivity
  , games = Dict.empty
  , user =
    { id = "andreas"
    , name = "andreas"
    , email = "andreas.moller@gmail.com"
    }
  }

encode : Model -> Value
encode model =
  Json.Encode.object [
    ("gameForm", Model.Game.encode model.gameForm),
    ("activityForm", Model.Activity.encode model.activityForm),
    ("games", Util.Dict.encode Model.Game.encode model.games),
    ("user", Model.User.encode model.user)
  ]

decoder : Decoder Model
decoder =
  Json.Decode.object6
    Model
    ("gameForm" := Model.Game.decoder)
    ("activityForm" := Model.Activity.decoder)
    ("games" := Json.Decode.dict Model.Game.decoder)
    ("page" := Model.Page.decoder)
    ("url" := Json.Decode.string)
    ("user" := Model.User.decoder)
