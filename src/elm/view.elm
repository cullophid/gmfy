module View where

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Components.Route exposing (route)
import Components.Header exposing (header)
import Actions exposing (actions)
import Pages.NewGamePage exposing (newGamePage)
import Pages.HomePage exposing (homePage)
import Pages.GamesListPage exposing (gamesListPage)
import Pages.GamePage exposing (gamePage)
import Model exposing (Model)

view : Model -> Html
view model =
  let {newGame, games, location} = model
  in
    div [class "container-fluid full-screen bg-gray-ligthest"] [
      div [class "col-xs-8 col-xs-offset-2"] [
        header,
        div [class ""] [
          route "#home" (homePage) location,
          route "#new-game" (newGamePage newGame) location,
          route "#games/game" (gamePage model) location,
          route "#games" (gamesListPage games) location
        ]
      ]
    ]
