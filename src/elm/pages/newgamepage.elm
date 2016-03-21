module Pages.NewGamePage where
import Html exposing (..)
import Html.Attributes exposing (class, value, type')
import Html.Events exposing (..)
import Util.Events exposing (onInput, onSubmit')
import Model exposing (..)
import Actions exposing (..)
import Pages.NewTaskForm exposing (newTaskForm)

newGamePage : Model -> Html
newGamePage model =
  let
    {gameForm, taskForm} = model
    {game} = gameForm
  in
    div [class "card"] [
      form [onSubmit' actions.address (Actions.CreateGame game)] [
        div [ class "card-block"] [
          h4 [class "card-title"] [text "New Game"],
          div [class "form-group"] [
            label [] [text "Title"],
            input [
              class "form-control",
              value game.title,
              onInput actions.address Actions.SetGameTitle
            ][]
          ]
        ],
        div [ class "card-block"] [
          h4 [class "card-title"] [text "Tasks"],
          div [class "list-group list-group-flush"] <| List.map gameTask game.tasks,
          newTaskForm taskForm
        ],
        div [ class "card-block"] [
          button [
            type' "button",
            class "btn btn-success",
            onClick actions.address (Actions.CreateGame game)
          ] [text "Create Game"]
        ]
      ]
    ]

gameTask : GameTask -> Html
gameTask task =
  li [class "list-group-item"] [text task.title]
