module View.GamesListPage (gamesListPage) where

import Html exposing (..)
import Html.Attributes exposing (href, class)
import Model.Game exposing (Game)

gamesListPage : List Game -> Html
gamesListPage games =
  div [class "card"]
    [ div [class "card-block"]
      [ h1 [] [text "Games"]
      ]
    , div [class "list-group list-group-flush"]
      <| List.map listItem games
  ]

listItem : Game -> Html
listItem {title, description, id} =
  div [class "list-group-item"] [
    a [href ("#games/" ++ id ++ "/activities")] [
      div [class "media"] [
        div [class "media-left"] [
          div [class "fa fa-gamepad fa-4x text-primary"] []
        ],
        div [class "media-body"] [
          h3 [] [text title],
          p [] [text description]
        ]
      ]
    ]
  ]
