module View.NewGamePage where

import Html exposing (..)
import Html.Attributes exposing (class, value, type', href)
import Dict exposing (Dict)
import Util.Events exposing (onClick, onInput, onSubmit)
import Model exposing (..)
import Actions exposing (..)
import View.NewTaskForm exposing (newTaskForm)

newGamePage : Model -> Html
newGamePage model =
  let
    {gameForm, taskForm} = model
    {game} = gameForm
  in
    div [class "card"]
      [ form [onSubmit (Actions.CreateGame game)]
        [ div [ class "card-block"]
            [ h4 [class "card-title"] [text "New Game"]
            , div [class "form-group"]
              [ label [] [text "Title"]
              , input
                [ class "form-control"
                , value game.title
                , onInput Actions.SetGameTitle
                ] []
              ]
            ]
        , div [ class "card-block"]
          [ h4 [class "card-title"] [text "Tasks"]
          , div [class "list-group list-group-flush"]
            <| List.map (gameTask << snd) game.tasks
          , newTaskForm taskForm
          ]
        , div [ class "card-block clearfix"]
          [ div [class "pull-xs-right"]
            [ a
              [ type' "button"
              ,  class "btn btn-danger-outline"
              ,  href "#games"
              ] [text "Cancel"]
            , text " "
            , button
            [ type' "button"
            , class "btn btn-success-outline"
            , onClick (Actions.CreateGame game)
            ] [text "Create Game"]
          ]
        ]
      ]
    ]

gameTask : GameTask -> Html
gameTask task =
  li [class "list-group-item"] [text task.title]
