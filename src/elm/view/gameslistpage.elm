module View.GamesListPage (gamesListPage) where

import Html exposing (..)
import Html.Attributes exposing (href, class)

gamesListPage games =
  div [class "card"]
    [ div [class "card-block"]
      [ h1 [] [text "Games"]
      ]
    , div [class "list-group list-group-flush"] <| List.map listItem games
  ]

listItem {title, id} =
  div [class "list-group-item"] [
    a [href ("#games/" ++ (toString id))] [text title]
  ]
