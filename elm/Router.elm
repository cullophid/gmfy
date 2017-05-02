module Router exposing (..)

import Navigation exposing (Location)
import Msg exposing (Msg)
import Activity exposing (emptyActivityForm)
import Game exposing (emptyGameForm)
import RemoteData exposing (RemoteData(..))
import Api
import Navigation
import UrlParser exposing (oneOf, s, (</>), map, string, parsePath, parseHash)

type Route =
    NotFound
  | HomeRoute
  | LoginRoute
  | LoginPendingRoute
  | LoginTokenRoute String
  | GameListRoute
  | NewGameRoute
  | NewActivityRoute String
  | GameRoute String String
  | InvitePlayerRoute String
  | ActivityRoute String

parseRoute : Location -> Route
parseRoute location =
  let
    parser = oneOf [
      map NewActivityRoute (s "games" </> string </> s "activities" </> s "new"),
      map InvitePlayerRoute (s "games" </> string </> s "invite"),
      map NewGameRoute (s "games" </> s "new"),
      map ActivityRoute (s "activities" </> string),
      map ((flip GameRoute) location.hash) (s "games" </> string),
      map GameListRoute (s "games"),
      map LoginPendingRoute (s "login" </> s "pending"),
      map LoginTokenRoute (s "login" </> string),
      map LoginRoute (s "login"),
      map HomeRoute (s "")
      ]
  in
    Maybe.withDefault NotFound <| parsePath parser location

isProtectedRoute : Route -> Bool
isProtectedRoute route =
  case route of
    LoginRoute -> False
    LoginPendingRoute -> False
    LoginTokenRoute _ ->  False
    _ -> True

update location prevModel =
  let
    route = Debug.log "Route" <| parseRoute location
    model = { prevModel | history = location :: prevModel.history, route = route }
    isAuthenticated = RemoteData.isSuccess model.user
  in
    if isProtectedRoute route && not isAuthenticated then
      case model.user of
        Loading -> (model, Cmd.none)
        NotAsked -> ({model | user = Loading}, Api.fetchSession location)
        Failure err -> ({ model | error = Just err}, Cmd.none)
        Success _ -> (model, Cmd.none) -- impossible state
    else
      authenticatedRoutes route model

authenticatedRoutes route model =
  case route of
    NotFound ->
      (model, Cmd.none)
    LoginRoute ->
        ({model| user = NotAsked}, Cmd.none)
    LoginPendingRoute ->
      (model, Cmd.none)
    LoginTokenRoute token->
      ({model| user = Loading}, Api.validateToken token)
    HomeRoute ->
      (model, Navigation.modifyUrl "/games")
    GameListRoute ->
      ({model | gameList = Loading}, Api.getGameList)
    NewActivityRoute gameId ->
      ({model | activityForm = emptyActivityForm gameId}, Cmd.none)
    NewGameRoute ->
      ({model | gameForm = emptyGameForm, game = NotAsked }, Cmd.none)
    GameRoute gameId _ ->
      gameRoute gameId model
    InvitePlayerRoute gameId ->
      (model, Cmd.none)
    ActivityRoute activityId ->
      ({model | activity = Loading}, Api.getActivity activityId)

gameRoute gameId model =
  let
    fetchGame = ({model | game = Loading}, Api.getGame gameId)
  in
    case model.game of
      Success {id} ->
        if id == gameId then (model, Cmd.none) else fetchGame
      _ -> fetchGame
