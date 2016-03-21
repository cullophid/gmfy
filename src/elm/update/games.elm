module Update.Games where
import Actions
import Model exposing (Model, Model, Game)
import Actions exposing (..)

games : Action -> Model -> Model
games action model =
  {model | games = updateGames action model.games}


updateGames : Action -> List Game -> List Game
updateGames action games =
  case action of
    CreateGame game -> game :: games
    _ -> games
