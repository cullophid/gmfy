module Update.Games where
import Actions
import Util.List exposing (last, updateById)
import String
import Util
import Model exposing (Model, Model, Game)
import Actions exposing (..)

games : Action -> Model -> Model
games action model =
    let
      {location, games, user} =
        model
      gameId =
        Maybe.withDefault "" <| last <| String.split "/" location
    in
      case action of
        CreateGame game ->
          {model | games = (Util.addId game) :: games}
        CompleteTask {value} ->
          { model
          | games = updateById gameId (updatePlayerScore user value) games
          }
        _ -> model



updatePlayerScore : String -> Int -> Game -> Game
updatePlayerScore id value game =
  let
    {players} = game
  in
    { game
    | players = updateById id (\player -> {player | score = value + player.score}) players
    }
