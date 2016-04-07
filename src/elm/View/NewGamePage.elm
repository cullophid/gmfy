module View.NewGamePage where

import Dict
import Html exposing (..)
import Html.Attributes exposing (class, value, type', href)
import Util.Events exposing (onClick, onInput, onSubmit)
import Model.Game exposing (Game)
import Actions exposing (..)

newGamePage {gameForm} =
  let
    {id, title} = gameForm
  in
  div [class "col-md-6 col-md-offset-3"] [
    div [class "row m-t-1 m-b-1"] [
      div [class "container-fluid container-fluid"] [
        h1 [] [
          a [href "javascript:history.back()", class "fa fa-chevron-circle-left"] [],
          text (" " ++ (if id == "" then "New Game" else title))
        ]
      ]
    ],
    div [class "row card"] [
      div [class "card-block"] [
        form [onSubmit (CreateGame gameForm)] [
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
          ],
          div [ class "clearfix"] [
            div [class "pull-xs-right"] [
              a [ type' "button",
                  class "btn btn-danger-outline",
                  href "javascript:history.back()"
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
    ]
  ]
