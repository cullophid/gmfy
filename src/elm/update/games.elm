module Update.Games where
import Actions
import Model exposing (Model, Model, Game, GameEntry)
import Actions exposing (..)

games : Action -> Model -> Model
games action model =
  {model | games = updateGames action model.games}


updateGames : Action -> List GameEntry -> List GameEntry
updateGames action games =
  case action of
    CreateGame game -> createGameEntry game games
    _ -> games


createGameEntry : Game -> List GameEntry -> List GameEntry
createGameEntry game gamesList =
  let
    id = nextId gamesList
  in
    (id, {game | id = id}) :: gamesList

nextId games =
  toString <| List.length games
