module Pages.GamePage where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Actions exposing (..)
import Util.Events exposing (onInput)

gamePage : Model -> Html
gamePage model =
  let
    game' = List.head model.games
    taskForm = model.taskForm
  in
    case game' of
      Just game ->
        div [class "container-fluid"] [
          div [class "card"] [
            div [class "card-block"] [
              h1 [] [text game.title]
            ],

            div [class "card-block"] [
              ul [class "list-group list-group-flush"]
                <| List.map gameTask game.tasks
            ]
          ]
        ]
      _ -> div [] []

gameTask : GameTask -> Html
gameTask task =
  li [class "list-group-item"] [text task.title]
