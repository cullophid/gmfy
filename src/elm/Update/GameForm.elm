module Update.GameForm (gameForm) where
import Util
import Dict
import Actions exposing (..)
import Model exposing (Model)
import Model.User exposing (User)
import Model.Player exposing (Player)
import Model.Game exposing (Game, emptyGame)
import Model.Page exposing (..)

gameForm : Action -> Model -> Model
gameForm action model =
  let
    {user, gameForm,games} = model
    {activities, players} = gameForm
  in
    case action of

      Navigate "#/games/new" ->
        {model| gameForm = resetGameForm user}
      SetGameTitle title ->
        { model
        | gameForm = {gameForm | title = title}
        }

      SetGameDescription description ->
        { model
        | gameForm = {gameForm | description = description}
        }

      _ ->
        model


resetGameForm : User -> Game
resetGameForm user =
  {emptyGame| players = Dict.insert user.id (userPlayer user) Dict.empty }

userPlayer : User -> Player
userPlayer {id, name, email} =
  { id = id
  , name = name
  , email = email
  , score = 0
  }
