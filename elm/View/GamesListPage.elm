module View.GamesListPage exposing (gamesListPage)
import Html exposing (Html, h1, h3, p, text, i, span)
import Html.Attributes exposing (class, href)
import Msg exposing (Msg)
import RemoteData exposing (RemoteData(..))
import Game exposing (GameListItem, GameList)
import Bulma exposing (div)
import Bulma.Components exposing (media, mediaLeft, mediaContent, nav)
import Bulma.Elements exposing (title, subtitle, image, scrollpane, link)
import Bulma.Layout exposing (hero, container, section, heading)
import Bulma.Grid exposing (column)
import View.Loader exposing (loadingScreen)
import View.Header exposing (signoutButton)
import View.List exposing (list, listItem)

gamesListPage : GameList -> Html Msg
gamesListPage games =
  div "flex-column" [
    nav "has-shadow" [signoutButton],
    case games of
      Loading -> loadingScreen "Loading Games"
      Success games ->
        scrollpane "" [
          column "" [
            container "" [
              list "" <| List.map listGame games,
              column "" [
                link  "button is-primary" "/games/new" [
                text "New Game"
                ]
              ]
            ]
          ]
        ]
      _ -> div "" []
  ]

listGame : GameListItem -> Html Msg
listGame game =
  listItem "" [
    link  "column" ("/games/" ++ game.id ++ "#about") [
      media "" [
        mediaLeft "" [
          image "is-48x48" game.icon
        ],
        mediaContent "" [
          title "is-4" [text game.title],
          subtitle "" [text game.description]
        ]
      ]
    ]
  ]
