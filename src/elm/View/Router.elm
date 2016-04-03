module View.Router (appRouter) where

import Dict
import Util.Router exposing (route)
import View.GamesListPage exposing (gamesListPage)
import View.GamePage exposing (gamePage)
import View.HomePage exposing (homePage)
import View.NotFoundPage exposing (notFoundPage)
import Html exposing (..)
import Model exposing (Model)
import Model.Url as Url
appRouter : Model -> Html
appRouter model =
  case model.location of
    Url.Home ->
      homePage
    Url.GamesList ->
      gamesListPage
        { games = Dict.values model.games
        }
    Url.GameActivities gameid ->
      gamePage
        { game = (Dict.get gameid model.games)
        , user = model.user
        }
    _ -> notFoundPage
