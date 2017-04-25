module App.Update exposing (update)

import App exposing (Msg(..), Model)
import Navigation
import Route.Update as Route
import Game.Update as Game
import InviteForm.Update as InviteForm
import Auth.Update as Auth
import Activity.Update as Activity

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  let
    {gameForm, activityForm} = model
  in
    case msg of
      ClearError ->
        ({model | error = Nothing }, Cmd.none)
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
      InviteFormMsg msg ->
        InviteForm.update msg model
      AuthMsg msg ->
        Auth.update msg model
