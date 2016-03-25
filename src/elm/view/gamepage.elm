module View.GamePage where

import String
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Actions
import Util.List exposing (last, findById)
import View.NotFoundPage exposing (notFoundPage)

gamePage : Model -> Html
gamePage {location, games, taskForm, user} =
  let
    gameId =
      Maybe.withDefault "missing" <| last <| String.split "/" location
    game' =
      findById gameId games
    player' =
      Maybe.andThen game' (\{players} -> findById user players)
    data =
      Maybe.map2 (\a b -> (a, b)) game' player'
  in
    case data of
      Just (game, player) ->
          showGamePage player game
      _ -> notFoundPage

showGamePage : Player -> Game -> Html
showGamePage player game =
  div [class "card"] [
    div [class "card-block"] [
      h1 [] [text <| game.title ++ " (" ++ (toString player.score) ++ ")"]
    ],
    div [class "card-block"] [
      div [class "list-group list-group-flush"]
        <| List.map gameTask game.tasks
    ]
  ]

gameTask : GameTask -> Html
gameTask task =
  div [class "list-group-item"]
    [ div [class "media"]
      [ div [class "media-left"]
        [ div [class "fa fa-3x fa-check-square-o text-primary"] []
        ]
      , div [class "media-body"]
      [ button
        [ class "btn btn-sm btn-primary pull-xs-right pull-right"
        , onClick Actions.address (Actions.CompleteTask task)
        ] [text "Complete"]
        , h5 [] [text task.title]
        , p [] [text task.description]
        ]
      ]
    ]
