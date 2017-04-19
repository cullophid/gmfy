module Update.Game exposing (update)

import Game exposing (GameMsg(..), emptyGame, emptyGameForm)
import App exposing (Model, Msg)
import Focus exposing (Focus, set, (=>))
import Util exposing (title_, description_, indexWith)
import Navigation
import RemoteData exposing (RemoteData(..))
import Dict
import Api
-- import GraphApi

gameForm_ : Focus {a | gameForm: b} b
gameForm_ = Focus.create .gameForm (\f x -> {x | gameForm = f x.gameForm})

update : GameMsg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    GameTitle title ->
      (set (gameForm_ => title_) title model, Cmd.none)
    GameDescription description ->
      (set (gameForm_ => description_) description model, Cmd.none)
    SubmitGame gameForm ->
      (model, Api.createGame gameForm)

    CreateGameFail err ->
        ({ model | error = Just err }, Cmd.none)
    CreateGameSuccess game ->
      ({ model |
          games = RemoteData.map (Dict.insert game.id game) model.games,
          gameForm = emptyGameForm
        } , Navigation.newUrl "/games")
    FetchGamesFail err ->
      ({model| games = Failure err}, Cmd.none)
    FetchGamesSuccess games ->
      ({ model | games = Success <| indexWith .id games}, Cmd.none)
