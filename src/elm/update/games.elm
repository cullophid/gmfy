module Update.Games where
import Actions
import Monocle.Lens exposing (Lens, compose, modify)
import Model exposing (Model, Model, Game)
import Actions exposing (..)

games : Action -> Model -> Model
games action model = modify gamesLens (update action) model

gamesLens = Lens .games (\f a -> {a | games = f})

update : Action -> List Game -> List Game
update action games =
  case action of
    CreateGame game -> game :: games
    _ -> games
