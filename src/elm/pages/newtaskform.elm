module Pages.NewTaskForm where
import Html exposing (..)
import Html.Attributes exposing (class, type')
import Html.Events exposing (..)
import Model exposing (TaskForm, GameTask)
import Util.Events exposing (onInput, onNumberInput)
import Actions exposing (actions)

newTaskForm : TaskForm -> Html
newTaskForm taskForm =
  let {showTaskForm, task} = taskForm
  in
    case showTaskForm of
      True -> content task
      _ ->
        button [
          class "btn btn-success",
          onClick actions.address (Actions.ShowTaskForm True)
        ] [text "Add Task"]


content : GameTask -> Html
content task =
  div [class "card-block"] [
    form [] [
      div [class "form-group"] [
        label [] [text "Task Title"],
        input [
          class "form-control",
          onInput actions.address Actions.SetTaskTitle
        ] []
      ],
      div [class "form-group"] [
        label [] [text "Task Description"],
        textarea [
          class "form-control",
          onInput actions.address Actions.SetTaskDescription
        ] []
      ],
      div [class "form-group"] [
        label [] [text "Task Value"],
        input [
          class "form-control",
          type' "number",
          onNumberInput actions.address Actions.SetTaskValue
        ] []
      ],
      button [
        class "btn btn-danger",
        onClick actions.address (Actions.ShowTaskForm False)
      ] [text "cancel"],
      button [
        class "btn btn-success",
        onClick actions.address (Actions.AddTask task)
      ] [text "add"]
    ]
  ]
