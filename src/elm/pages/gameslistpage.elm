module Pages.GamesListPage(gamesListPage) where
import Html exposing (..)
import Html.Attributes exposing (..)
import Util.Events exposing (linkTo)

gamesListPage games =
  div [class "card"] [
    div [class "list-group list-group-flush"] <| List.map listItem games
  ]

listItem {title, id} =
  div [class "list-group-item"] [
    a [linkTo ("#games/" ++ (toString id))] [text title]
  ]
