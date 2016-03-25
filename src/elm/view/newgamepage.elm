module View.NewGamePage where

import Html exposing (..)
import Html.Attributes exposing (class, value, type', href)
import Util.Events exposing (onClick, onInput, onSubmit)
import Model exposing (..)
import Actions exposing (..)
import View.NewTaskForm exposing (newTaskForm)

newGamePage : Model -> Html
newGamePage model =
  let
    {gameForm, taskForm, showTaskForm} = model
  in
    div [class "card"] [
      form [onSubmit (Actions.CreateGame gameForm)] [
        div [ class "card-block"] [
          h4 [class "card-title"] [text "New Game"],
          div [class "form-group"] [
            label [] [text "Title"],
            input [
              class "form-control",
              value gameForm.title,
              onInput Actions.SetGameTitle
            ] []
          ],
            div [class "form-group"] [
              label [] [text "Description"],
              textarea [
                class "form-control",
                value gameForm.description,
                onInput Actions.SetGameDescription
              ] []
            ]
        ],
        div [ class "card-block"] [
          h4 [class "card-title"] [text "Tasks"],
          div [class "list-group list-group-flush"]
                <| List.map gameTask gameForm.tasks,
          newTaskForm (showTaskForm, taskForm)
        ],
        div [ class "card-block clearfix"] [
          div [class "pull-xs-right"] [
            a [ type' "button",
                class "btn btn-danger-outline",
                href "#games"
            ] [text "Cancel"],
            text " ",
            button [
              type' "button",
              class "btn btn-success-outline",
              onClick (Actions.CreateGame gameForm)
            ] [text "Create Game"]
          ]
        ]
      ]
    ]

gameTask : GameTask -> Html
gameTask task =
  li [class "list-group-item"] [text task.title]
