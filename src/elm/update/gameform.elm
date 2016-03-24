module Update.GameForm where
import Actions exposing (Action)
import Model exposing (Model, Game, GameForm, emptyGame, emptyPlayer)

gameForm : Action -> Model -> Model
gameForm action model =
  let {user, gameForm} = model
  in
    case action of
      Actions.Location "#games/new" ->
        {model | gameForm = setInitialPlayers user gameForm}
      _ ->
        {model | gameForm = updateForm action gameForm}

setInitialPlayers user gameForm =
  {gameForm | game = {emptyGame | players = [(user, emptyPlayer)]}}

updateForm : Action -> GameForm -> GameForm
updateForm action gameForm =
  case action of
    _ -> {gameForm | game = updateGame action gameForm.game}

updateGame : Action -> Game -> Game
updateGame action game =
  let
    newId =
      nextId game.tasks
  in
    case action of
      Actions.SetGameTitle title ->
        {game | title = title}
      Actions.AddTask task ->
        {game | tasks = (newId, {task| id = newId}) :: game.tasks}
      _ -> game

nextId tasks  =
  toString <| List.length tasks
