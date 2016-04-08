module View.GamesListPage (gamesListPage) where

import Html exposing (..)
import Html.Attributes exposing (href, class)
import Model.Game exposing (Game)
import View.Header as Header

gamesListPage {games} =
  div [] [
    Header.header "Games",
    div [class "col-md-6 col-md-offset-3"] [
      div [class "row"] [
        div [class "list-group"]
          <| List.map listItem <| Debug.log "GAMES" games
      ]
    ],
    a [
      class "fixed-bottom-right btn btn-success",
      href "#/games/new"
      ] [text "New Game"]
  ]

listItem : Game -> Html
listItem {title, description, id} =
  div [class "list-group-item"] [
    a [href ("#/games/" ++ id ++ "/activities")] [
      div [class "media"] [
        div [class "media-left"] [
          div [class "fa fa-gamepad fa-3x"] []
        ],
        div [class "media-body"] [
          h3 [] [text title],
          p [] [text description]
        ]
      ]
    ]
  ]
