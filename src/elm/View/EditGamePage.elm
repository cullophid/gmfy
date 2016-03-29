module View.GamePage where

import Html exposing (..)
import Html.Attributes exposing (..)
import Model.Game exposing (Game)

gamePage : Maybe Game -> Html
gamePage param =
  case param of
    Just {title} ->
      div [class "container-fluid"] [
        h1 [] [text title]
      ]
    _ -> div [] []
