module App exposing (Model, Msg(..), emptyModel)

import Game exposing (Game, GameList, GameForm, GameMsg, emptyGameForm)
import Activity exposing (ActivityListItem, Activity, ActivityForm, ActivityMsg, emptyActivityForm)
import InviteForm.Types exposing (InviteFormMsg, InviteForm, emptyInviteForm)
import User exposing (User, andreas)
import Auth.Data exposing (AuthMsg, LoginForm, emptyLoginForm)
import RemoteData exposing (RemoteData(..))
import Navigation exposing (Location)
import Route exposing (Route(..))
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
  history : List Location,
  inviteForm: InviteForm
  }

type Msg =
    UrlChange Navigation.Location
  | ClearError
  | Navigate String
  | Back
  | GameMsg GameMsg
  | ActivityMsg ActivityMsg
  | InviteFormMsg InviteFormMsg
  | AuthMsg AuthMsg

emptyModel : Model
emptyModel = {
  user = RemoteData.succeed andreas,
  route = GameListRoute,
  error = Nothing,
  gameForm = emptyGameForm,
  loginForm = emptyLoginForm,
  activityForm = emptyActivityForm "",
  gameList = RemoteData.NotAsked,
  game = RemoteData.NotAsked,
  activity = RemoteData.NotAsked,
  history = [],
  inviteForm = emptyInviteForm
  }
