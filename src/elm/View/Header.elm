module View.Header exposing (render)
import Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class, href)

render : String -> Html Msg
render title =
  div [class "card-block"] [
    div [class "space-between"] [
      a [href "#/", class "fa fa-home fa-2x"] [],
      h1 [ class ""] [ text <| " " ++ title ],
      div [] []
    ]
  ]
