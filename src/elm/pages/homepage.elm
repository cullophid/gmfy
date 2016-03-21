module Pages.HomePage where
import Html exposing (..)
import Html.Attributes exposing (..)

homePage =
  div [ class "container-fluid"] [
    div [ class "card" ] [
      div [ class "card-block" ] [
        h1 [] [ text "Welcome to GMFY" ]
      ]
    ]
  ]
