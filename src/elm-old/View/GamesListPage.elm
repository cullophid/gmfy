module View.GamesListPage (gamesListPage) where

import Html exposing (..)
import Html.Attributes exposing (href, class)
import Model.Game exposing (Game)
import View.Header as Header

gamesListPage {games} =
  div [] [
    Header.header "Games" (div [] []),
    div [class "col-md-6 col-md-offset-3"] [
      div [class "row"] [
        div [class "list-group anim-list-stagger"]
          <| List.map listItem <| Debug.log "GAMES" games
      ]
    ],
    a [
      class "fixed-bottom-right btn btn-success anim-from-right anim-delay-500",
      href "#/games/new"
      ] [text "New Game"]
  ]

listItem : Game -> Html
listItem {title, description, id} =
  div [class "list-group-item anim-from-left"] [
    a [href ("#/games/" ++ id ++ "/activities")] [
      div [class "media"] [
        div [class "media-left"] [
          div [class "fa fa-circle-o fa-3x"] []
        ],
        div [class "media-body"] [
          h3 [] [text title],
          p [] [text description]
        ]
      ]
    ]
  ]
