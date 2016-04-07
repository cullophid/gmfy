module View.NewActivityPage where
import Html exposing (..)
import Html.Attributes exposing (class, type', href)
import Model.Activity exposing (Activity)
import Util.Events exposing (onInput, onNumberInput, onClick)
import Actions exposing (..)
import View.Header as Header

newActivityPage {activityForm, gameId} =
  let
    {title, id} = activityForm
  in
    div [] [
      Header.header "New Activity",
      div [class "col-md-8 col-md-offset-2"] [
        div [class "row"] [
          div [class "container-fluid card"] [
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
                    a [
                      class "btn btn-danger-outline",
                      href ("#/games/" ++ gameId ++ "/activities")
                    ] [text "cancel"],
                    text " ",
                    button [
                      type' "button",
                      class "btn btn-success-outline",
                      onClick (AddActivity gameId activityForm)
                    ] [text "add"]
                  ]
                ]
              ]
            ]
          ]
        ]
      ]
    ]
