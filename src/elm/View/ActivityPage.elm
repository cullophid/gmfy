module View.ActivityPage (activityPage) where
import Html exposing (..)
import Html.Attributes exposing (class)
import Util.Events exposing (onClick)
import View.Header as Header
import Actions exposing (..)

activityPage {activity}  =
  case activity of
    Nothing -> text ""
    Just activity ->
      div [] [
        Header.header activity.title,
        div [class "col-md-6 col-md-offset-3"] [
          h1 [] [
          text activity.title,
          span [class "label label-default label-pill pull-xs-right"] [text (toString activity.value)]
          ],
          p [] [text activity.description],
          div [] [
            button [
              class "btn btn-success btn-block",
              onClick (CompleteActivity activity)
            ] [ text "Complete Activity"]
          ]
        ]
      ]
