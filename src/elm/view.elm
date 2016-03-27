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
import Model exposing (Model)

view : Model -> Html
view model =
  let {gameForm, games, location} = model
  in
    div [class "full-screen"]
      [ header
      , div [class "container-fluid m-t-1"]
        [ div [class "row"]
          [ div [class "col-md-10 col-md-offset-1"]
            [ div [class ""]
              [ router
                [ route "#home" (homePage)
                , route "^#games/new$" (newGamePage model)
                , route "^#games$" (gamesListPage <| Dict.values games)
                , route "^#games/" (gamePage model)
                ] location
              ]
            ]
          ]
        ]
      ]
