module View.Header where

import Html exposing (..)
import Html.Attributes exposing (class, href)

header : String -> Html
header title =
  div [class "row bg-primary card-block"] [
    div [class "container-fluid"] [
      h1 [] [
        a [href "#/", class "fa fa-home"] [],
        text <| " " ++ title
      ]
    ]
  ]
  
