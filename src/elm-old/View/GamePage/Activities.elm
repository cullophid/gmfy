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
    div [class "list-group anim-list-stagger"]
      <| List.map (activity game) <| Dict.values game.activities,
    a [
      class "fixed-bottom-right btn btn-success anim-from-right anim-delay-400",
      href ("#/games/" ++ game.id ++ "/activities/new")
      ] [text "New Activity"]

  ]

activity game activity =
  a [class "list-group-item anim-from-left", href ("#/games/" ++ game.id ++ "/activities/" ++ activity.id)] [
    div [class "media"] [
      div [class "media-left"] [
        div [class "fa fa-3x fa-check-square-o"] [  ]
      ],
      div [class "media-body"] [
        h5 [] [text activity.title],
        p [] [text activity.description]
      ]
    ]
  ]