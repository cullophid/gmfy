module View.ActivityPage (activityPage) where
import Html exposing (..)
import Html.Attributes exposing (class)
import Util.Events exposing (onClick)
import View.Header as Header
import Actions exposing (..)

activityPage {gameId, activity, showHeaderMenu}  =
  case activity of
    Nothing -> text ""
    Just activity ->
      div [] [
        Header.header activity.title (menu gameId activity showHeaderMenu),
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

menu gameId activity showHeaderMenu =
  div [ class <| "dropdown" ++ (if showHeaderMenu then " is-open" else "")] [
    span [
      class "fa fa-2x fa-ellipsis-v",
      onClick (ToggleHeaderMenu True)
      ] [],
    div [class "dropdown-list"] [
      div [
        class "dropdown-list-item",
        onClick (DeleteActivity gameId activity.id)
      ] [
        text "Delete Activity"
      ]
    ]
  ]
