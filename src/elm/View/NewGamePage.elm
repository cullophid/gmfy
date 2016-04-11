module View.NewGamePage where

import Dict
import Html exposing (..)
import Html.Attributes exposing (class, value, type', href)
import Util.Events exposing (onClick, onInput, onSubmit)
import Model.Game exposing (Game)
import Actions exposing (..)
import View.Header as Header

newGamePage {gameForm} =
  let
    {id, title} = gameForm
  in
    div [] [
      Header.header "New Game" (div [] []),
      div [class "col-md-6 col-md-offset-3"] [
        form [onSubmit (CreateGame gameForm)] [
          div [class "form-group"] [
            label [class ""] [text "Title"],
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
          ],
          div [ class "row"] [
            div [class "col-xs-6"] [
              a [ type' "button",
                  class "btn btn-danger btn-block",
                  href "#/"
              ] [text "Cancel"]
            ],
            div [class "col-xs-6"] [
              button [
                type' "button",
                class "btn btn-success btn-block",
                onClick (Actions.CreateGame gameForm)
              ] [text "Create Game"]
            ]
          ]
        ]
      ]
    ]
