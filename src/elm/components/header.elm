module Components.Header where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Util.Events exposing (linkTo)

header =
  nav [class "navbar navbar-light"] [
    ul [class "nav navbar-nav"] [
      li [class "nav-item"] [
        a [
          class "nav-link",
          linkTo "#home"
        ] [text "home"]
      ],
      li [class "nav-item"] [
        a [
          class "nav-link",
          linkTo "#games"
        ] [text "games"]
      ]
    ]
  ]
