module View.Header where

import Html exposing (..)
import Html.Attributes exposing (class, href)

header : Html
header =
  div [class "row"] [
    nav [class "navbar"] [
      div [class "nav-item"] [
        a [href "#"] [
          span [class "fa fa-home fa-2x"] []
        ]
      ]
    ]
  ]
