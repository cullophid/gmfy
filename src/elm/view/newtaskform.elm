module View.NewTaskForm where
import Html exposing (..)
import Html.Attributes exposing (class, type')
import Model exposing (GameTask)
import Util.Events exposing (onInput, onNumberInput, onClick)
import Actions

newTaskForm : (Bool, GameTask) -> Html
newTaskForm (showTaskForm, taskForm) =
  case showTaskForm of
    True -> content taskForm
    _ ->
      button [
        class "btn btn-success-outline",
        onClick (Actions.ShowTaskForm True)
      ] [text "Add Task"]


content : GameTask -> Html
content task =
  div [class "card-block"] [
    form [] [
      div [class "form-group"] [
        label [] [text "Task Title"],
        input [
          class "form-control",
          onInput Actions.SetTaskTitle
        ] []
      ],
      div [class "form-group"] [
        label [] [text "Task Description"],
        textarea [
          class "form-control",
          onInput Actions.SetTaskDescription
        ] []
      ],
      div [class "form-group"] [
        label [] [text "Task Value"],
        input [
          class "form-control",
          type' "number",
          onNumberInput Actions.SetTaskValue
        ] []
      ],
      div [class "clearfix"] [
        div [class "pull-xs-right"] [
          button [
            class "btn btn-danger-outline",
            onClick (Actions.ShowTaskForm False)
          ] [text "cancel"],
          text " ",
          button [
            class "btn btn-success-outline",
            onClick (Actions.AddTask task)
          ] [text "add"]
        ]
      ]
    ]
  ]
