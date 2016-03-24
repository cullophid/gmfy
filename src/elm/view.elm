module View where

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import View.Router exposing (router, route)
import View.Header exposing (header)
import View.NewGamePage exposing (newGamePage)
import View.HomePage exposing (homePage)
import View.GamesListPage exposing (gamesListPage)
import View.GamePage exposing (gamePage)
import Model exposing (Model)

view : Model -> Html
view model =
  let {gameForm, games, location} = model
  in
    div [class "full-screen bg-gray-dark"]
      [ header
      , div [class "container-fluid m-t-1"]
        [ div [class "row"]
          [ div [class "col-md-10 col-md-offset-1"]
            [ div [class ""]
              [ router
                [ route "#home" (homePage)
                , route "#games/new" (newGamePage model)
                , route "#games/[0-9]*" (gamePage model)
                , route "#games" (gamesListPage games)
                ] location
              ]
            ]
          ]
        ]
      ]
