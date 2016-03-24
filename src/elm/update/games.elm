module Update.Games where
import Actions
import Util.Map as Map
import Util.List exposing (last)
import String
import Model exposing (Model, Model, Game, GameEntry)
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
          {model | games = createGameEntry game games}
        CompleteTask {value} ->
          { model
          | games = Map.update gameId (updatePlayerScore user value) games
          }
        _ -> model


createGameEntry : Game -> List GameEntry -> List GameEntry
createGameEntry game gamesList =
  let
    id = nextId gamesList
  in
    (id, {game | id = id}) :: gamesList

nextId games =
  toString <| List.length games


updatePlayerScore : String -> Int -> Game -> Game
updatePlayerScore id value game =
  let
    {players} = game
  in
    { game
    | players = Map.update id (\player -> {player | score = value + player.score}) players
    }
