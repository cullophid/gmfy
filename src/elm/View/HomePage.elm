module View.HomePage where

import Html exposing (..)
import Html.Attributes exposing (..)
import View.Header as Header

homePage : Html
homePage =
  div [] [
    Header.header "GMFY",
    div [class "col-md-6 col-md-offset-3 m-t-1"] [
      div [class "row"] [
        div [class "card-block"] [
          h2 [] [ text "Welcome to GMFY" ],
          div [class "form-group"] [
            a [href "#/games", class "btn btn-block btn-default-outline"] [text "View Your games"]
          ],
          div [] [
            a [href "#/games/new", class "btn btn-block btn-default-outline"] [text "Create New Game"]
          ]

        ]
      ]
    ]
  ]
