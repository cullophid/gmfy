module Pages.GamePage where
import String
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Actions exposing (..)
import Util.Events exposing (onInput)
import Util.List exposing (find, last)
import Util.Game exposing (getSelectedGame)

gamePage : Model -> Html
gamePage {location, games, taskForm, user} =
  let
    userId = user.id
    game' = Debug.log "game" <| getSelectedGame location games
    playerscore = Maybe.map snd <| Maybe.andThen (Maybe.map .players game') (find (\(id, _) -> id == userId))
  in
    case game' of
      Just game ->
        case playerscore of
          Just score -> showGamePage score game
          _ -> text "NO player score"
      _ -> text "No Game"

showGamePage : Int -> Game -> Html
showGamePage score game =
  div [class "container-fluid"] [
    div [class "card"] [
      div [class "card-block"] [
        h1 [] [text <| game.title ++ " (" ++ (toString score) ++ ")"]
      ],
      div [class "card-block"] [
        ul [class "list-group list-group-flush"]
          <| List.map gameTask game.tasks
      ]
    ]
  ]

gameTask : GameTask -> Html
gameTask task =
  li [class "list-group-item"] [
    text task.title,
    button [
      class "btn btn-sm btn-primary pull-xs-right",
      onClick actions.address (Actions.CompleteTask task)
    ]
    [text "Complete"]
  ]
