module Pages.GamePage where
import String
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Actions exposing (..)
import Util.Events exposing (onInput)
import Util.List exposing (find, last)

gamePage : Model -> Html
gamePage {location, games, taskForm} =
  let
    game' = Debug.log "game" <| getSelectedGame location games
  in
    case game' of
      Just game ->
        div [class "container-fluid"] [
          div [class "card"] [
            div [class "card-block"] [
              h1 [] [text game.title]
            ],

            div [class "card-block"] [
              ul [class "list-group list-group-flush"]
                <| List.map gameTask game.tasks
            ]
          ]
        ]
      _ -> div [] []

gameTask : GameTask -> Html
gameTask task =
  li [class "list-group-item"] [text task.title]

getSelectedGame : String -> List Game -> Maybe Game
getSelectedGame location games =
  let
    gameId = chain toInt (last (String.split "/" location))
  in
    case gameId of
      Just selected -> find (\{id} -> id == selected) games
      _ -> Nothing


chain : (a -> Maybe b) -> Maybe a -> Maybe b
chain f a =
  case a of
    Just v -> f v
    Nothing -> Nothing

toInt : String -> Maybe Int
toInt str =
  case String.toInt str of
    Ok v -> Just v
    _ -> Nothing
