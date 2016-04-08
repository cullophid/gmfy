module View.Header where

import Html exposing (..)
import Html.Attributes exposing (class, href)

header : String -> Html
header title =
  div [class "card-block"] [
    div [class "space-between"] [
      a [href "#/", class "fa fa-home fa-2x"] [],
      h1 [ class ""] [ text <| " " ++ title ],
      span [class "fa fa-2x fa-ellipsis-v"] []
    ]
  ]
