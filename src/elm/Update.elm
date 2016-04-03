module Update where
-- import Update.GameForm exposing (gameForm)
-- import Update.Games exposing (games)
import Update.Navigate exposing (navigate)
-- import Update.ActivityForm exposing (activityForm)
import Update.User exposing (user)
import Util.Functions exposing (composeAll)

import Actions exposing (Action)
import Model exposing (Model)

type alias Reducer =
  Action -> Model -> Model

update : Action -> Model -> Model
update action model =
  let
    updateAll = composeAll action
      [ user
      -- , gameForm
      -- , activityForm
      -- , games
      , navigate
      ]
  in
    updateAll model
