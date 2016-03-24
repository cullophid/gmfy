module View.GamePage where

import String
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Actions
import Util.Events exposing (onInput)
import Util.List exposing (find, last)
import Util.Map as Map

gamePage : Model -> Html
gamePage {location, games, taskForm, user} =
  let
    gameId =
      Maybe.withDefault "missing" <| last <| String.split "/" location
    game' =
      Map.get gameId games
    player' =
      Maybe.andThen game' (\{players} -> Map.get user players)
    data =
      Maybe.map2 (\a b -> (a, b)) game' player'
  in
    case data of
      Just (game, player) ->
          showGamePage player game
      _ -> text ""

showGamePage : Player -> Game -> Html
showGamePage player game =
  div [class "card"] [
    div [class "card-block"] [
      h1 [] [text <| game.title ++ " (" ++ (toString player.score) ++ ")"]
    ],
    div [class "card-block"] [
      ul [class "list-group list-group-flush"]
        <| List.map (gameTask << snd) game.tasks
    ]
  ]

gameTask : GameTask -> Html
gameTask task =
  li [class "list-group-item"] [
    text task.title,
    button [
      class "btn btn-sm btn-primary pull-xs-right",
      onClick Actions.address (Actions.CompleteTask task)
    ]
    [text "Complete"]
  ]
