module View where

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Components.Router exposing (router, route)
import Components.Header exposing (header)
import Actions exposing (actions)
import Pages.NewGamePage exposing (newGamePage)
import Pages.HomePage exposing (homePage)
import Pages.GamesListPage exposing (gamesListPage)
import Pages.GamePage exposing (gamePage)
import Model exposing (Model)

view : Model -> Html
view model =
  let {gameForm, games, location} = model
  in
    div [class "container-fluid full-screen bg-gray-ligthest"] [
      div [class "col-xs-8 col-xs-offset-2"] [
        header,
        div [class ""] [
          router [
            route "#home" (homePage),
            route "#new-game" (newGamePage model),
            route "#games/[0-9]*" (gamePage model),
            route "#games" (gamesListPage games)
          ] location
        ]
      ]
    ]
