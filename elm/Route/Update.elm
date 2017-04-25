module Route.Update exposing (update)

import Route.Data exposing (Route(..), parseRoute)
import Navigation exposing (Location)
import App.Data exposing (Model, Msg)
import Activity.Data exposing (emptyActivityForm)
import Game.Data exposing (emptyGameForm)
import RemoteData exposing (RemoteData(..))
import Game.Api
import Auth.Api
import Event.Api
import Activity.Api
import InviteForm.Api
import Navigation

update : Location -> Model -> (Model, Cmd Msg)
update location prevModel =
  let
    route = parseRoute location
    model = { prevModel | history = location :: prevModel.history, route = route }
  in
    case route of
      LoginRoute ->
        ({model| user = NotAsked}, Cmd.none)
      LoginPendingRoute ->
        (model, Cmd.none)
      _ ->
        case model.user of
          Success _ -> authenticatedRoutes route model
          _ ->
            (model, Navigation.modifyUrl "/login")

authenticatedRoutes route model =
  case route of
    NotFound ->
      (model, Cmd.none)
    LoginRoute ->
      ({model| user = NotAsked}, Cmd.none)
    LoginPendingRoute ->
      (model, Cmd.none)
    LoginTokenRoute token->
      ({model| user = Loading}, Auth.Api.validateToken token)
    HomeRoute ->
      (model, Navigation.modifyUrl "/games")
    GameListRoute ->
      ({model | gameList = Loading}, Game.Api.getGameList)
    NewActivityRoute gameId ->
      ({model | activityForm = emptyActivityForm gameId}, Cmd.none)
    NewGameRoute ->
      ({model | gameForm = emptyGameForm, game = NotAsked }, Cmd.none)
    GameRoute gameId ->
      ({model | game = Loading }, Game.Api.getGame gameId)
    InvitePlayerRoute gameId ->
      (model, Cmd.none)
    ActivityRoute activityId ->
      ({model | activity = Loading}, Activity.Api.getActivity activityId)
