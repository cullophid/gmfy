module View.GamePage exposing (gamePage)
import Html exposing (Html, text, strong)
import GraphQL.Client.Http as Http
import RemoteData exposing (RemoteData(..))
import Game exposing (Game, Player)
import User exposing (User)
import Event exposing (EventListItem)
import Msg exposing (Msg(..))
import Activity exposing (ActivityListItem)
import Bulma exposing (div, p, span)
import Bulma.Elements exposing (title, subtitle, tag, table, thead, tbody, th, tr, td, button, form, image, icon, scrollpane, link, sublink, back)
import Bulma.Components exposing (card, cardContent, modal, media, mediaLeft, mediaContent, nav, navItem, navLeft, navCenter, navRight, mediaRight)
import Bulma.Layout exposing (container, hero, section, heading)
import Bulma.Grid exposing (column, columns)
import View.Loader exposing (loader)
import View.Header exposing (homeButton)
import View.NotFoundPage exposing(notFoundPage)
import View.List exposing (list, listItem)
import View.Tabs exposing (tabs, Tab)
import Navigation exposing (Location)
import View.Gravatar exposing (gravatar)


type alias Props = {
  hash: String,
  game: RemoteData Http.Error Game,
  user: RemoteData Http.Error User
}

gamePage : Props -> Html Msg
gamePage props =
  case RemoteData.map2 (,) props.game props.user of
    Loading -> loader
    Failure err -> notFoundPage
    Success (game, user) ->
      content_ {game = game, user = user, hash = props.hash}
    _ -> text ""

tabHeader hash href title =
  let
      classes = "nav-item is-tab" ++ if hash == href then " is-active" else ""
  in
    sublink classes href [ text title ]

content_ : {game: Game, user:User, hash: String} -> Html Msg
content_ {user, game, hash} =
  div "flex-column" [
    nav "" [
      homeButton,
      navCenter "" [
        link "nav-item" "/" [ text "GMFY" ]
      ],
      navRight "" []
    ],
    nav "has-shadow" [
      navCenter "" [
        tabHeader hash "#about" "about",
        tabHeader hash "#activities" "Activities",
        tabHeader hash "#players" "Players"
      ]
    ],
    case hash of
      "#activities" ->
        activities_ game
      "#players" ->
        players_ user game
      _ ->
        home_ game
  ]

home_ game =
  scrollpane "" [
    section "" [
      columns "is-mobile" [
        image "column is-4 is-offset-4 " game.icon
      ],
      hero "" [
        container "has-text-centered" [
          title "" [text game.title],
          subtitle "" [text game.description]
        ]
      ]
    ]
  ]

players_ user game =
  let
      players = List.map2 (,) game.players (List.map (playerScore game.log) game.players)
        |> List.sortBy (\(_, score) -> score)
        |> List.reverse
  in

  scrollpane "" [
    container "" [
      column "" [
        list "" <| List.map player_ players,
        link "button is-primary" ("/games/" ++ game.id ++ "/invite") [
          text "Invite Player"
        ]
      ]
    ]
  ]

player_ (player, score) =
  let
      fullName = player.firstName ++ " " ++ player.lastName
  in
    listItem "column" [
      media "" [
        mediaLeft "" [
          gravatar "is-48x48" player.email
        ],
        mediaContent "" [
          title "is-5" [text fullName],
          subtitle "" [text player.email]
        ],
        mediaRight "" [
          div "tag is-primary" [
            text <| toString score
          ]
        ]
      ]
    ]

activities_ game =
  scrollpane "" [
    container "" [
      column "" [
        list "" <| List.map activity_ game.activities,
        link
          "button is-primary"
          ("/games/" ++ game.id ++ "/activities/new")
        [ text "New Activity"]
      ]
    ]
  ]

activity_ : ActivityListItem -> Html Msg
activity_ activity =
  listItem "" [
    link
      "column"
      ("/activities/" ++ activity.id)
    [
      media "" [
        mediaLeft "" [
          image "is-48x48" activity.icon
        ],
        mediaContent "" [
          title "is-4" [text activity.title],
          subtitle "" [text activity.description]
        ],
        mediaRight "" [
          button "is-primary" (CompleteActivity activity.id) [
            icon "" "fa-check"
          ]
        ]
      ]
    ]
  ]

playerScore events player =
  events
    |> List.filter (\e -> e.player == player.id)
    |> List.map .score
    |> List.foldl (+) 0
