module View.Header where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Util.Events exposing (linkTo)

header =
  nav [class "navbar navbar-dark bg-primary"] [
    a [class "navbar-brand", linkTo "#home"] [text "GMFY"],
    ul [class "nav navbar-nav"] [
      li [class "nav-item"] [
        a [
          class "nav-link link-white",
          linkTo "#home"
        ] [text "home"]
      ],
      li [class "nav-item"] [
        a [
          class "nav-link link-white",
          linkTo "#games"
        ] [text "games"]
      ]
    ]
  ]
