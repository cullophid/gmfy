module Pages.GamePage where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Game)

gamePage : Maybe Game -> Html
gamePage param =
  case param of
    Just {name} ->
      div [class "container-fluid"] [
        div [class "card"] [
          div [class "card-block"] [
            h1 [] [text name]
          ]
        ]
      ]
    _ -> div [] []
