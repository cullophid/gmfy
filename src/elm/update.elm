module Update where
import Update.GameForm exposing (gameForm)
import Update.Games exposing (games)
import Update.Location exposing (location)
import Update.TaskForm exposing (taskForm)

import Actions exposing (Action)
import Model exposing (Model)

type alias Reducer =
  Action -> Model -> Model

composeAll action = (List.foldl (<<) (\a -> a)) << List.map (\r -> r action)

update action model =
  let
    updateAll = composeAll (Debug.watch "action" action) [
      gameForm,
      taskForm,
      games,
      location
    ]
  in
    updateAll model
