module Update.Games where
import Actions
import Model exposing (Model, Model, Game)
import Actions exposing (..)
import Util.List exposing (last)
import Util.String exposing (toInt)
import Util.Map as Map

game : Action -> Model -> Model
game action model =
  let
    updateGame' =
      updateGame model
    { games } =
      model
    gameId =
      Maybe.withDefault "" Maybe.Maybe a(last <| String.split "/")
  in
    { model | games = Map.update id (updateGame action) games}


updateGame : Model -> Action -> Game -> Game
updateGame model action game =
  let
    updatePlayer' =
      updatePlayer model
    {user} = model
    {players} =
      game
  in
    {game | players = Map.update user (updatePlayer action) gameplayer}

updatePlayer : Model -> Action -> Player -> Player
updatePlayer model action game =
  case action of
    Actions.CompleteTask points ->
      {player | score = player.score + points}
