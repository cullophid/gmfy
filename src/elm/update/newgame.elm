module Update.NewGame where
import Actions exposing (Action)
import Model exposing (Model, Game)
import Monocle.Lens exposing (Lens, compose, modify)

newGame : Action -> Model -> Model
newGame action model = modify formLens (update action) model

formLens = Lens .newGame (\f a -> {a | newGame = f})

gameLens = compose formLens <| Lens .game (\f a -> {a | game = f})

update : Action -> Game -> Game
update action form =
  case action of
    Actions.SetGameTitle title ->
      modify gameLens (\game -> {game | title = title}) form
    Actions.GoTo location ->
      if
        location == "#new-game"
      then gameLens.set {title = "", tasks = []} form
      else form
    _ -> form
