module View.NewGamePage where

import Dict
import Html exposing (..)
import Html.Attributes exposing (class, value, type', href)
import Util.Events exposing (onClick, onInput, onSubmit)
import Model exposing (Model)
import Model.Activity exposing (Activity)
import Actions exposing (..)
import View.NewActivityForm exposing (newActivityForm)

newGamePage : Model -> Html
newGamePage model =
  let
    {gameForm, activityForm, showActivityForm} = model
  in
    div [class "card"] [
      form [onSubmit (CreateGame gameForm)] [
        div [ class "card-block"] [
          h4 [class "card-title"] [text "New Game"],
          div [class "form-group"] [
            label [] [text "Title"],
            input [
              class "form-control",
              value gameForm.title,
              onInput SetGameTitle
            ] []
          ],
            div [class "form-group"] [
              label [] [text "Description"],
              textarea [
                class "form-control",
                value gameForm.description,
                onInput SetGameDescription
              ] []
            ]
        ],
        div [ class "card-block"] [
          h4 [class "card-title"] [text "Activities"],
          div [class "list-group list-group-flush"]
                <| List.map activity <| Dict.values gameForm.activities,
          newActivityForm (showActivityForm, activityForm)
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

activity : Activity -> Html
activity activity =
  li [class "list-group-item"] [text activity.title]
