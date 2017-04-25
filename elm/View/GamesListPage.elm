module View.GamesListPage exposing (gamesListPage)
import Html exposing (Html, h1, h3, p, text, i, span)
import Html.Attributes exposing (class, href)
import App.Data exposing (Msg)
import RemoteData exposing (RemoteData(..))
import Game.Data exposing (GameListItem, GameList)
import Bulma exposing (link, div)
import Bulma.Components exposing (card, cardContent)
import Bulma.Layout exposing (container)
import Bulma.Grid exposing (column)
import View.Loader exposing (loadingScreen)
import View.Header exposing (header, homeButton)


gamesListPage : GameList -> Html Msg
gamesListPage games =
  div "" [
    header "is-primary" "Games" homeButton,
    case games of
      Loading -> loadingScreen "Loading Games"
      Success games ->
        container "" [
          column "" <| List.map listGame games
        ]
      _ -> div "" [],
      link  "button is-primary fixed-bottom-right" "/games/new" [
        text "New Game"
      ]
  ]

listGame : GameListItem -> Html Msg
listGame {id, title, description} =
  column "anim-fold-in" [
    link  "" ("/games/" ++ id) [
      card "" [
        cardContent "" [
          h3 [class "title is-4"] [text title],
          p [] [text description]
        ]
      ]
    ]
  ]
