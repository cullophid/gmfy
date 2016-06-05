module View.Header exposing (render)
import Html exposing (..)
import Html.Attributes exposing (class, href)

render title =
  div [class "card-block"] [
    div [class "space-between"] [
      a [href "#/", class "fa fa-home fa-2x"] [],
      h1 [ class ""] [ text <| " " ++ title ],
      div [] []
    ]
  ]
