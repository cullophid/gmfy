module Update.App exposing (update)

import App exposing (Msg(..), Model)
import Navigation
import Update.Route as Route
import Update.Game as Game
import Update.Activity as Activity
import Update.Event as Event

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  let
    {gameForm, activityForm} = model
  in
    case msg of
      UrlChange location ->
        Route.update location model

      Navigate to -> (model, Navigation.newUrl to)
      Back ->
        let
          history = Maybe.withDefault [] <| Maybe.andThen List.tail <| List.tail model.history
        in
          ({model| history = history}, Navigation.back 1)

      ActivityMsg msg ->
        Activity.update msg model
      GameMsg msg ->
        Game.update msg model
      EventMsg msg ->
        Event.update msg model
