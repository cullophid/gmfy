module View.GamesListPage (gamesListPage) where

import Html exposing (..)
import Html.Attributes exposing (href, class)
import Model.Game exposing (Game)
import View.Header

gamesListPage {games} =
  div [class "col-md-6 col-md-offset-3"] [
    div [class "row m-t-1 m-b-1 relative"] [
      div [class "container-fluid container-fluid"] [
        h1 [] [
          a [href "#", class "fa fa-chevron-circle-left"] [],
          text " Games"
        ],
        a [
          class "btn btn-success-outline floating-button",
          href "#/games/new"
        ] [text "New Game"]
      ]
    ],
    div [class "row card"] [
      div [class "list-group list-group-flush"]
        <| List.map listItem games

    ]

  ]

listItem : Game -> Html
listItem {title, description, id} =
  div [class "list-group-item"] [
    a [href ("#/games/" ++ id ++ "/activities")] [
      div [class "media"] [
        div [class "media-left"] [
          div [class "fa fa-gamepad fa-3x text-primary"] []
        ],
        div [class "media-body"] [
          h3 [] [text title],
          p [] [text description]
        ]
      ]
    ]
  ]
