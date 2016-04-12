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
      Header.header "New Activity" (div [] []),
      div [class "col-md-6 col-md-offset-3"] [
        form [] [
          div [class "form-group anim-fold-in"] [
            label [] [text "Activity Title"],
            input [
              class "form-control",
              onInput SetActivityTitle
            ] []
          ],
          div [class "form-group anim-fold-in anim-delay-100"] [
            label [] [text "Activity Description"],
            textarea [
              class "form-control",
              onInput SetActivityDescription
            ] []
          ],
          div [class "form-group anim-fold-in anim-delay-200"] [
            label [] [text "Activity Value"],
            input [
              class "form-control",
              type' "number",
              onNumberInput SetActivityValue
            ] []
          ],
          div [class "row"] [
            div [class "col-xs-6 anim-fold-in anim-delay-300"] [
              a [
                class "btn btn-danger btn-block",
                href ("#/games/" ++ gameId ++ "/activities")
              ] [text "cancel"],
              text " "
            ],
            div [class "col-xs-6 anim-fold-in anim-delay-400"] [
              button [
                type' "button",
                class "btn btn-success btn-block",
                onClick (AddActivity gameId activityForm)
              ] [text "add"]
            ]
          ]
        ]
      ]
    ]
