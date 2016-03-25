module Update.GameForm (gameForm) where
import String
import Util
import Actions exposing (..)
import Model exposing (Model, Game, GameTask, emptyGame, emptyPlayer)

gameForm : Action -> Model -> Model
gameForm action model =
  let
    {user, gameForm,games} = model
    {tasks, players} = gameForm
  in
    case action of
      Location "#games/new" ->
        { model
        | gameForm = resetGameForm user
        }
      SetGameTitle title ->
        { model
        | gameForm = {gameForm | title = title}
        }

      SetGameDescription description ->
        { model
        | gameForm = {gameForm | description = description}
        }

      AddTask task ->
        {model
        | gameForm =
          {gameForm
          | tasks =  (Util.addId task) :: tasks
          }
        }

      _ ->
        model


resetGameForm : String -> Game
resetGameForm user =
  {emptyGame| players = [{emptyPlayer| id = user}]}
