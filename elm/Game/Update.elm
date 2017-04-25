module Game.Update exposing (update)

import Game exposing (GameMsg(..), emptyGameForm, Game)
import Event exposing (EventListItem)
import App exposing (Model, Msg)
import Focus exposing (Focus, set, (=>))
import Util exposing (title_, description_, indexWith)
import Navigation
import RemoteData exposing (RemoteData(..))
import Api

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
          game = Success game,
          gameForm = emptyGameForm
        } , Navigation.newUrl "/games")
    FetchGameListFail err ->
      ({model|  gameList = Failure err}, Cmd.none)
      -- ({model| games = Failure err}, Cmd.none)
    FetchGameListSuccess games ->
      ({ model | gameList = Success games}, Cmd.none)
    FetchGameFail err ->
      ({model | game = Failure err }, Cmd.none)
    FetchGameSuccess game ->
      ({model | game = Success game }, Cmd.none)
    CompleteActivityFail err ->
      ({model | error = Just err}, Cmd.none)
    CompleteActivitySuccess event ->
      ({model | game = RemoteData.map (addEvent event) model.game}, Navigation.newUrl ("/games/" ++ event.game))


addEvent : EventListItem -> Game -> Game
addEvent event game =
  {game | log = event :: game.log}
