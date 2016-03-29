module View.HomePage where

import Html exposing (..)
import Html.Attributes exposing (..)
import View.Header

homePage : Html
homePage =
  div [class "col-md-6 col-md-offset-3"] [
    div [class "row m-t-1 m-b-1"] [
      div [class "container-fluid container-fluid"] [
        h1 [] [
          a [href "#", class "fa fa-home"] [],
          text " GMFY"
        ]
      ]
    ],
    div [class "row card"] [
      div [class "card-block"] [
        h2 [] [ text "Welcome to GMFY" ],
        div [] [
          a [href "#games"] [text "View your current games"]
        ],
        div [] [
          a [href "#games/new"] [text "Create New Game"]
        ]

      ]
    ]
  ]
