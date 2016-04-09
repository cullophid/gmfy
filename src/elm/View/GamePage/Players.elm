module View.GamePage.Players (gamePlayers) where
import Html exposing (..)
import Html.Attributes exposing (class)
import Model.Player exposing (Player)
import Dict

gamePlayers {game, user} =
  let
    players = Dict.values game.players
  in
    div [class "list-group list-group-flush"]
      <| List.map player <| List.sortBy .score players


player : Player -> Html
player {name, score} =
    div [class "list-group-item"] [
      div [class "media"] [
        div [class "media-left"] [
          div [class "fa fa-3x fa-user"] []
        ],
        div [class "media-body"] [
          h5 [class "pull-xs-left"] [text name],
          h3 [class "pull-xs-right"] [
            p [class "label label-default label-pill"] [text <| toString score]
          ]
        ]
      ]
    ]
