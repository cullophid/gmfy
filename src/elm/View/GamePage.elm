module View.GamePage where
import Dict exposing (Dict)
import String
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Model)
import Model.Game exposing (Game)
import Model.Player exposing (Player)
import Model.Page as Page
import Actions exposing (..)
import Util.List exposing (last, findById, nth)
import Util.Router exposing (router, route)
import View.NotFoundPage exposing (notFoundPage)
import View.Header

gamePage props childPage =
  let
    {game, page, user} = props
  in
    case game of
      Nothing ->
        notFoundPage
      Just g ->
        showGamePage
          { game = g
          , page = props.page
          , user = props.user
          }
          childPage



showGamePage {game, page, user} childPage=
  div [class "col-md-6 col-md-offset-3"] [
    div [class "row m-t-1 m-b-1 relative"] [
      div [class "container-fluid container-fluid"] [
        h1 [] [
          a [href "#/games", class "fa fa-chevron-circle-left"] [],
          text (" " ++ game.title)
        ],
        case page of
          Page.GameActivities _ ->
            newActivityButton game
          _ -> text ""
      ]
    ],
    div [class "row"] [
      nav [class "navbar"] [
        ul [class "nav navbar-nav"] [
          li [class "nav-item"] [
            a [
              class "nav-link",
              href ("#/games/" ++ game.id ++ "/activities")
            ] [text "Activities"]
          ],
          li [class "nav-item"] [
            a [
              class "nav-link",
              href ("#/games/" ++ game.id ++ "/players")
            ]
            [text "Players"]
          ]
        ]
      ]
    ],
    div [class "row card"] [
      childPage {game = game, user = user}
    ]
  ]


newActivityButton game =
  a [
    class "btn btn-success-outline floating-button",
    href ("#/games/" ++ game.id ++ "/activities/new")
  ] [text "New Activity"]
