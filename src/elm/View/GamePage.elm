module View.GamePage where
import Dict exposing (Dict)
import String
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Model)
import Model.Game exposing (Game)
import Model.Player exposing (Player)
import Actions exposing (..)
import Util.List exposing (last, findById, nth)
import Util.Router exposing (router, route)
import View.NotFoundPage exposing (notFoundPage)
import View.GamePage.Activities exposing (renderActivities)
import View.GamePage.ActivityForm exposing (renderActivityForm)
import View.GamePage.Players exposing (players)
import View.Header

gamePage : Model -> Html
gamePage  model =
  let
    {location, games, activityForm, user} =
      model
    gameId =
      Maybe.withDefault "missing" <| nth 1 (String.split "/" location)
    game' =
      Dict.get gameId games
    player' =
      Maybe.andThen game' (\{players} -> Dict.get user.id players)
    data =
      Maybe.map2 (\a b -> (a, b)) game' player'
  in
    case data of
      Just (game, player) ->
          showGamePage player game model
      _ -> notFoundPage

showGamePage : Player -> Game -> Model -> Html
showGamePage player game {location, activityForm} =
  div [class "col-md-6 col-md-offset-3"] [
    div [class "row m-t-1 m-b-1 relative"] [
      div [class "container-fluid container-fluid"] [
        h1 [] [
          a [href "#games", class "fa fa-chevron-circle-left"] [],
          text (" " ++ game.title)
        ],
        router [
          route "#games/[a-z0-9]*/activities" (newActivityButton game)
        ] location
      ]
    ],
    div [class "row"] [
      nav [class "navbar"] [
        ul [class "nav navbar-nav"] [
          li [class "nav-item"] [
            a [
              class "nav-link",
              href ("#games/" ++ game.id ++ "/activities")
            ] [text "Activities"]
          ],
          li [class "nav-item"] [
            a [
              class "nav-link",
              href ("#games/" ++ game.id ++ "/players")
            ]
            [text "Players"]
          ]
        ]
      ]
    ],
    div [class "row card"] [
      router [
        route "#games/[0-9a-z|-]*/activities/new"
          <| renderActivityForm activityForm,
        route "#games/[0-9a-z|-]*/activities"
          <| renderActivities (Dict.values game.activities),
        route "#games/[0-9a-z|-]*/players"
          <| players (Dict.values game.players)
      ] location
    ]
  ]


newActivityButton game =
  a [
    class "btn btn-success-outline floating-button",
    href ("#games/" ++ game.id ++ "/activities/new")
  ] [text "New Activity"]
