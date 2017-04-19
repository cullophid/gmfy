module Update.Route exposing (update)

import Route exposing (Route(..), parseRoute)
import Navigation exposing (Location)
import App exposing (Model, Msg)
import RemoteData exposing (RemoteData(..))
import Api

update : Location -> Model -> (Model, Cmd Msg)
update location prevModel =
  let
    route = parseRoute location
    model = { prevModel | history = location :: prevModel.history, route = route }
  in
    case route of
      NotFound ->
        (model, Navigation.newUrl "/games")
      GameListRoute ->
        ({model | games = Loading}, Api.getGameList)
      GameRoute gameId ->
        let
            cmd = Cmd.batch [
              if RemoteData.isNotAsked model.games then Api.getGameList else Cmd.none,
              Api.getGameActivities gameId,
              Api.getGameEvents gameId
            ]
        in
          ({model |
            activities = Loading,
            events = Loading,
            games = if RemoteData.isNotAsked model.games then Loading else model.games
          }, cmd)
      _ ->
        (model, Cmd.none)
