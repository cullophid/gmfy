module View.GamesListPage (gamesListPage) where

import Html exposing (..)
import Html.Attributes exposing (href, class)
import Model exposing (Game)

gamesListPage : List (String, Game) -> Html
gamesListPage games =
  div [class "card"]
    [ div [class "card-block"]
      [ h1 [] [text "Games"]
      ]
    , div [class "list-group list-group-flush"]
      <| List.map (listItem << snd) games
  ]

listItem {title, id} =
  div [class "list-group-item"] [
    a [href ("#games/" ++ id)] [text title]
  ]
