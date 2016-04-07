module View.NewActivityPage where
import Html exposing (..)
import Html.Attributes exposing (class, type', href)
import Model.Activity exposing (Activity)
import Util.Events exposing (onInput, onNumberInput, onClick)
import Actions exposing (..)

newActivityPage {activityForm, gameId} =
  let
    {title, id} = activityForm
  in
    div [class "col-md-8 col-md-offset-2"] [
      div [class "row m-t-1 m-b-1"] [
        div [class "container-fluid container-fluid"] [
          h1 [] [
            a [href ("#/games/" ++ gameId ++ "/activities" ), class "fa fa-chevron-circle-left"] [text " "],
            text (" " ++ (if id == "" then "New Activity" else title))
          ]
        ]
      ],
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
