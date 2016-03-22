module Pages.GamesListPage(gamesListPage) where
import Html exposing (..)
import Html.Attributes exposing (..)
import Util.Events exposing (linkTo)

gamesListPage games =
  div [class "card"] [
    div [class "card-block"] [
      div [class "list-group list-group-flush"] <| List.map listItem games
    ],
    div [class "card-block"] [
      button [
        class "btn btn-primary btn-outline",
        linkTo "#games/new"
      ][text "New Game"]
    ]
  ]

listItem {title, id} =
  div [class "list-group-item"] [
    a [linkTo ("#games/" ++ (toString id))] [text title]
  ]
