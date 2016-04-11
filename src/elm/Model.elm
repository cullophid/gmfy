module Model where
import Dict exposing (Dict)
import Model.Game exposing (Game, JsonGame, emptyGame)
import Model.Page exposing (Page)
import Model.Activity exposing (Activity, emptyActivity)
import Model.User exposing (User)
import Util.Dict
import Json.Encode exposing (Value)
import Json.Decode exposing (Decoder, (:=), decodeString)

type alias Model =
  { gameForm : Game
  , activityForm : Activity
  , games : Dict String Game
  , page : Page
  , url : String
  , user : User
  , showHeaderMenu : Bool
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
  , showHeaderMenu = False
  }

type alias JsonModel =
  { url : String
  , games : List (String, JsonGame)
  , user : User
  }


toJson : Model -> JsonModel
toJson model =
  { url = model.url
  , games = List.map (\ (id, game) -> (id, Model.Game.toJson game)) <| Dict.toList model.games
  , user = model.user
  }


fromJson data =
  { url = data.url
  , games = Dict.fromList
    <| List.map  (updateSnd Model.Game.fromJson) data.games
  , user = data.user
  , page = Model.Page.fromUrl data.url
  , gameForm = emptyGame
  , activityForm = emptyActivity
  , showHeaderMenu = False
  }

updateSnd f (a, b) =
  (a, f b)
