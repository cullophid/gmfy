module View.GamePage where
import Dict exposing (Dict)
import String
import Html exposing (..)
import Html.Attributes exposing (..)
import Util.Events exposing (onClick)
import Model exposing (Model)
import Model.Game exposing (Game)
import Model.Player exposing (Player)
import Model.Page as Page
import Actions exposing (..)
import Util.List exposing (last, findById, nth)
import Util.Router exposing (router, route)
import View.NotFoundPage exposing (notFoundPage)
import View.Header as Header

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
          , showHeaderMenu = props.showHeaderMenu
          }
          childPage



showGamePage {game, page, user, showHeaderMenu} childPage=
  div [] [
    Header.header game.title (menu game showHeaderMenu),
    div [class "col-md-6 col-md-offset-3"] [
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
      hr [][],
      div [class "row"] [
        childPage {game = game, user = user}
      ]
    ]
  ]

menu game showHeaderMenu =
  div [ class <| "dropdown" ++ (if showHeaderMenu then " is-open" else "")] [
    span [
      class "fa fa-2x fa-ellipsis-v",
      onClick (ToggleHeaderMenu True)
      ] [],
    div [class "dropdown-list anim-from-right"] [
      div [
        class "dropdown-list-item",
        onClick (DeleteGame game.id)
      ] [
        text "Delete Game"
      ]
    ]
  ]
