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
      Header.header "New Game",
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
          div [ class "fixed-bottom-right-sm"] [
            div [class ""] [
              a [ type' "button",
                  class "btn btn-danger",
                  href "#/"
              ] [text "Cancel"],
              text " ",
              button [
                type' "button",
                class "btn btn-success",
                onClick (Actions.CreateGame gameForm)
              ] [text "Create Game"]
            ]
          ]
        ]
      ]
    ]
