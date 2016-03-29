module View.GamePage.Players where
import Html exposing (..)
import Html.Attributes exposing (class)
import Model.Player exposing (Player)

players : List Player -> Html
players players =
  div [class "list-group list-group-flush"]
    <| List.map player <| List.sortBy .score players


player : Player -> Html
player {name, score} =
    div [class "list-group-item"] [
      div [class "media"] [
        div [class "media-left"] [
          div [class "fa fa-3x fa-check-square-o text-primary"] []
        ],
        div [class "media-body"] [
          h5 [class "pull-xs-left"] [text name],
          h3 [class "pull-xs-right"] [
            p [class "label label-primary label-pill"] [text <| toString score]
          ]
        ]
      ]
    ]
