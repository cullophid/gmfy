module Msg exposing (Msg(..))
import Navigation exposing (Location)
import GraphQL.Client.Http exposing (Error)
import Auth exposing (LoginForm)
import Activity exposing (Activity, ActivityListItem, ActivityForm)
import Game exposing (Game, GameListItem, GameForm, InviteForm)
import User exposing (User)
import Event exposing (EventListItem)



type Msg =
    UrlChange Location
  | ClearError
  | CloseModal
  | NewUrl String
  | ModifyUrl String
  | Back
  | UpdateActivityForm ActivityForm
  | CreateActivity ActivityForm
  | CreateActivityFail Error
  | CreateActivitySuccess Activity
  | FetchActivityFail Error
  | FetchActivitySuccess Activity
  | UpdateLoginForm LoginForm
  | LoginFail Error
  | LoginSuccess User
  | Logout
  | SendAuthEmail String
  | SendAuthEmailFail Error
  | SendAuthEmailSuccess String
  | CompleteActivity String
  | CompleteActivityFail Error
  | CompleteActivitySuccess EventListItem
  | UpdateGameForm GameForm
  | CreateGame GameForm
  | CreateGameSuccess Game
  | CreateGameFail Error
  | FetchGameListFail Error
  | FetchGameListSuccess (List GameListItem)
  | FetchGameFail Error
  | FetchGameSuccess Game
  | InvitePlayer String String
  | InvitePlayerFail Error
  | InvitePlayerSuccess String
  | UpdateInviteForm InviteForm
  | FetchSessionFail Error
  | FetchSessionSuccess Location User
