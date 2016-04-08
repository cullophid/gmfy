module View.HomePage where

import Html exposing (..)
import Html.Attributes exposing (..)
import View.Header as Header

homePage : Html
homePage =
  div [] [
    Header.header "GMFY",
    div [class "col-md-6 col-md-offset-3"] [
      h2 [] [ text "Welcome to GMFY" ],
      div [class "form-group"] [
        a [href "#/games", class "btn btn-block btn-white-outline"] [text "View Your games"]
      ],
      div [] [
        a [href "#/games/new", class "btn btn-block btn-white-outline"] [text "Create New Game"]
      ]

    ]
  ]
