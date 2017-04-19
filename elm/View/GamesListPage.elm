module View.GamesListPage exposing (gamesListPage)
import Html exposing (Html, div, h1, h3, p, text)
import Html.Attributes exposing (class, href)
import App exposing (Msg)
import Route exposing (Route(..))
import RemoteData exposing (RemoteData(..))
import Game exposing (Game, Games)
import View.Link exposing (link)
import Dict exposing (Dict)
import View.Loader exposing (loadingScreen)

gamesListPage : Route -> Games -> Html Msg
gamesListPage location games =
  div [class "col-md-6 col-md-offset-3 large-gutter-top"] [
    h1 [] [text "Games"],
    case games of
      Loading -> loadingScreen "Loading Games"
      Success games ->
        div [class "anim-list-stagger"]
          <| List.map listGame <| Dict.values games
      _ -> div [] [],
      link "/games/new"
         [ class "fixed-bottom-right btn btn-success" ]
         [ text "New Game"]
  ]

listGame : Game -> Html Msg
listGame {id, title, description} =
  div [class "anim-fold-in card card-block bg-white"] [
    link ("/games/" ++ id ) [] [
      h3 [] [text title],
      p [] [text description]
    ]
  ]
