module View.GamePage.Activities where
import Html exposing (..)
import Html.Attributes exposing (class, href)
import Util.Events exposing (onClick)
import Model.Activity exposing (Activity)
import Model.Game exposing (Game)
import Actions exposing (..)

renderActivities : List Activity -> Html
renderActivities activities =
  div [] [
    div [class "list-group list-group-flush"]
      <| List.map activity activities
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
