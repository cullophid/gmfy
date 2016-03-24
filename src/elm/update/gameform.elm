module Update.GameForm where
import Actions exposing (Action)
import Model exposing (Model, Game, GameForm, emptyGame)

gameForm : Action -> Model -> Model
gameForm action model =
  let {user, gameForm} = model
  in
    case action of
      Actions.Location "#games/new" -> {model | gameForm = setInitialPlayers user gameForm}
      _ -> {model | gameForm = updateForm action gameForm}

setInitialPlayers user gameForm =
  {gameForm | game = {emptyGame | players = [(user.id, 0)]}}

updateForm : Action -> GameForm -> GameForm
updateForm action gameForm =
  case action of
    _ -> {gameForm | game = updateGame action gameForm.game}

updateGame : Action -> Game -> Game
updateGame action game =
  case action of
    Actions.SetGameTitle title -> {game | title = title}
    Actions.AddTask task -> {game | tasks = (task :: game.tasks)}
    _ -> game
