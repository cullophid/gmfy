module View.Router (appRouter) where

import Dict
import Util.Router exposing (route)
import View.GamesListPage exposing (gamesListPage)
import View.GamePage exposing (gamePage)
import View.GamePage.Activities exposing (gameActivities)
import View.NewGamePage exposing (newGamePage)
import View.HomePage exposing (homePage)
import View.NotFoundPage exposing (notFoundPage)
import View.NewActivityPage exposing (newActivityPage)
import Html exposing (..)
import Model exposing (Model)
import Model.Page as Page
appRouter : Model -> Html
appRouter model =
  case model.page of
    Page.Home ->
      homePage
    Page.GamesList ->
      gamesListPage
        { games = Dict.values model.games
        }
    Page.NewGame ->
      newGamePage
        { gameForm = model.gameForm
        }
    Page.GameActivities gameId ->
      gamePage
        { game = (Dict.get gameId model.games)
        , user = model.user
        , page = model.page
        } gameActivities
    Page.NewActivity gameId ->
      newActivityPage
        { gameId = gameId
        , activityForm = model.activityForm
        }
    _ -> notFoundPage
