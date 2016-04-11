module View where

import Dict
import Html exposing (Html, div)
import Html.Attributes exposing (..)
import View.Router exposing (appRouter)
import View.Header exposing (header)
import Model exposing (Model)
import Util.Events exposing (onClick)
import Actions exposing (..)

view : Model -> Html
view model =
  div [class "full-screen"] [
    div [class "container-fluid"] [
      div [class "row"] [
        appRouter model
      ]
    ],
    div [
      class ("page-overlay" ++ if model.showHeaderMenu then " is-visible" else ""),
      onClick (ToggleHeaderMenu False)
      ] []

  ]
