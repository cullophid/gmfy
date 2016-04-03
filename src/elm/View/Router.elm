module View.Router (appRouter) where

import Dict
import Util.Router exposing (route)
import View.GamesListPage exposing (gamesListPage)
import View.HomePage exposing (homePage)
import View.NotFoundPage exposing (notFoundPage)
import Html exposing (..)
import Model exposing (Model)
import Model.Location as Location

appRouter : Model -> Html
appRouter model =
  case model.location of
    Location.Home ->
      homePage
    Location.GamesList _ ->
      gamesListPage <| Dict.values model.games
    Location.NotFound -> notFoundPage
