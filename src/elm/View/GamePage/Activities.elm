module View.GamePage.Activities where
import Html exposing (..)
import Html.Attributes exposing (class, href)
import Util.Events exposing (onClick)
import Model.Activity exposing (Activity)
import Model.Game exposing (Game)
import Actions exposing (..)
import Dict

gameActivities {game, user} =
  div [] [
    div [class "list-group"]
      <| List.map activity <| Dict.values game.activities
  ]

activity : Activity -> Html
activity activity =
  div [class "list-group-item"] [
    div [class "media"] [
      div [class "media-left"] [
        div [class "fa fa-3x fa-check-square-o text-primary"] []
      ],
      div [class "media-body"] [
        h5 [] [text activity.title],
        p [] [text activity.description]
      ]
    ]
  ]
