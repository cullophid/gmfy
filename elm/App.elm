module App exposing (Model, emptyModel)

import Game exposing (Game, GameList, GameForm, InviteForm, emptyGameForm, emptyInviteForm)
import Activity exposing (ActivityListItem, Activity, ActivityForm, emptyActivityForm)
import User exposing (User, andreas)
import Auth exposing (LoginForm, emptyLoginForm)
import RemoteData exposing (RemoteData(..))
import Navigation exposing (Location)
import Router exposing (Route(..))
import Modal exposing (Modal(..))
import GraphQL.Client.Http as Http


type alias Model = {
  user: RemoteData Http.Error User,
  route: Route,
  error: Maybe Http.Error,
  gameForm : GameForm,
  loginForm: LoginForm,
  activityForm : ActivityForm,
  gameList : GameList,
  game: RemoteData Http.Error Game,
  activity: RemoteData Http.Error Activity,
  modal: Modal,
  history : List Location,
  inviteForm: InviteForm
  }


emptyModel : Model
emptyModel = {
  user = NotAsked,
  route = GameListRoute,
  error = Nothing,
  gameForm = emptyGameForm,
  loginForm = emptyLoginForm,
  activityForm = emptyActivityForm "",
  modal = Closed,
  gameList = RemoteData.NotAsked,
  game = RemoteData.NotAsked,
  activity = RemoteData.NotAsked,
  history = [],
  inviteForm = emptyInviteForm
  }
