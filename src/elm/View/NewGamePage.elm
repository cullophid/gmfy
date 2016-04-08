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
          div [ class "clearfix fixed-b-r-sm"] [
            div [class "pull-xs-right"] [
              a [ type' "button",
                  class "btn btn-danger",
                  href "javascript:history.back()"
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
