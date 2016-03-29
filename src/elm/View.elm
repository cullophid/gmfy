module View where

import Dict
import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Util.Router exposing (router, route)
import View.Header exposing (header)
import View.NewGamePage exposing (newGamePage)
import View.HomePage exposing (homePage)
import View.GamesListPage exposing (gamesListPage)
import View.GamePage exposing (gamePage)
import View.GamePage.ActivityForm exposing (renderActivityForm)
import Model exposing (Model)

view : Model -> Html
view model =
  let {gameForm, games, location} = model
  in
    div [class "full-screen"] [
      div [class "container-fluid m-t-1"] [
        div [class "row"] [
          router [
            route "^#games/new$" (newGamePage model.gameForm),
            route "^#games$" (gamesListPage <| Dict.values games),
            route "^#games/[a-z0-9]*/activities/new" (renderActivityForm model.activityForm),
            route "^#games/" (gamePage model),
            route "^$" (homePage)
          ] location
        ]
      ]
    ]
