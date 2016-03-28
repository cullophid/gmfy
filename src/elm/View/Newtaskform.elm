module View.NewActivityForm where
import Html exposing (..)
import Html.Attributes exposing (class, type')
import Model.Activity exposing (Activity)
import Util.Events exposing (onInput, onNumberInput, onClick)
import Actions exposing (..)

newActivityForm : (Bool, Activity) -> Html
newActivityForm (showActivityForm, activityForm) =
  case showActivityForm of
    True -> content activityForm
    _ ->
      button [
        class "btn btn-success-outline",
        onClick (ShowActivityForm True)
      ] [text "Add Activity"]


content : Activity -> Html
content activity =
  div [class "card-block"] [
    form [] [
      div [class "form-group"] [
        label [] [text "Activity Title"],
        input [
          class "form-control",
          onInput SetActivityTitle
        ] []
      ],
      div [class "form-group"] [
        label [] [text "Activity Description"],
        textarea [
          class "form-control",
          onInput SetActivityDescription
        ] []
      ],
      div [class "form-group"] [
        label [] [text "Activity Value"],
        input [
          class "form-control",
          type' "number",
          onNumberInput SetActivityValue
        ] []
      ],
      div [class "clearfix"] [
        div [class "pull-xs-right"] [
          button [
            class "btn btn-danger-outline",
            onClick (ShowActivityForm False)
          ] [text "cancel"],
          text " ",
          button [
            class "btn btn-success-outline",
            onClick (AddActivity activity)
          ] [text "add"]
        ]
      ]
    ]
  ]
