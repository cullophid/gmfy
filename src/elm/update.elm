module Update where
import Update.GameForm exposing (gameForm)
import Update.Games exposing (games)
import Update.Location exposing (location)
import Update.TaskForm exposing (taskForm)
import Update.User exposing (user)
import Util.Functions exposing (composeAll)

import Actions exposing (Action)
import Model exposing (Model)

type alias Reducer =
  Action -> Model -> Model

update action model =
  let
    updateAll = composeAll (Debug.watch "action" action) [
      user,
      gameForm,
      taskForm,
      games,
      location
    ]
  in
    updateAll model
