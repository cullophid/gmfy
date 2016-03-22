module Update.Games where
import Actions
import Model exposing (Model, Model, Game)
import Actions exposing (..)
import Util.List exposing (last)
import Util.String exposing (toInt)

game : Action -> Model -> Model
game action model =
  let
    id = Maybe.andThen (last <| String.split "/") toInt
  in
    case id of
      Just i -> {model | games = updateGames (updateGame action) i model.games }
      _ -> model

updatePlayers : Action -> Model -> Model
  let
    game = getGame location games

updateGames : (Game -> Game) -> Int -> List Game -> List Game
upadteGames f id games =
  List.map (\game -> if id == game.id then f(game) else game) games

updateGame : Action -> List Game -> List Game
updateGame action games =
  case action of
    CreateGame game -> {game | id = List.length games} :: games
    _ -> games


getSelectedGame : String -> List Game -> Maybe Game
getSelectedGame location games =
  let
    gameId = 
