module App exposing (Model, Msg(..), emptyModel)

import Game exposing (Game, Games, GameForm, GameMsg, emptyGameForm)
import Activity exposing (Activity, Activities, ActivityForm, ActivityMsg, emptyActivityForm)
import Event exposing (EventMsg, Event, Events)
import User exposing (User, andreas)
import RemoteData exposing (WebData)
import Navigation exposing (Location)
import Route exposing (Route(..))
import Http


type alias Model = {
  user: WebData User,
  route: Route,
  error: Maybe Http.Error,
  gameForm : GameForm,
  activityForm : ActivityForm,
  games : Games,
  events: Events,
  activities: Activities,
  history : List Location
  }


type Msg =
    UrlChange Navigation.Location
  | Navigate String
  | Back
  | GameMsg GameMsg
  | ActivityMsg ActivityMsg
  | EventMsg EventMsg

emptyModel : Model
emptyModel = {
  user = RemoteData.succeed andreas,
  route = GameListRoute,
  error = Nothing,
  gameForm = emptyGameForm,
  events = RemoteData.NotAsked,
  activityForm = emptyActivityForm,
  games = RemoteData.NotAsked,
  activities = RemoteData.NotAsked,
  history = []
  }
