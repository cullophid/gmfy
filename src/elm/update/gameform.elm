module Update.GameForm where
import Actions exposing (Action)
import Model exposing (Model, Game, GameForm, emptyGame)

gameForm : Action -> Model -> Model
gameForm action model =
  {model | gameForm = updateForm action model.gameForm}

updateForm : Action -> GameForm -> GameForm
updateForm action gameForm =
  case action of
    Actions.GoTo "#new-game" -> {gameForm | game = emptyGame}
    _ -> {gameForm | game = updateGame action gameForm.game}

updateGame : Action -> Game -> Game
updateGame action game =
  case action of
    Actions.SetGameTitle title -> {game | title = title}
    Actions.AddTask task -> {game | tasks = (task :: game.tasks)}
    _ -> game
