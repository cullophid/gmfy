module View.GamePage exposing (gamePage)
import Html exposing (Html, text)
import GraphQL.Client.Http as Http
import RemoteData exposing (RemoteData(..))
import Game.Data exposing (Game, GameMsg(..))
import User.Data exposing (User)
import Event.Data exposing (EventListItem)
import App.Data exposing (Msg(..))
import Activity.Data exposing (ActivityListItem, ActivityMsg(..))
import Bulma exposing (link, back, div, p, span)
import Bulma.Elements exposing (title, tag, table, thead, tbody, th, tr, td, button, form)
import Bulma.Components exposing (card, cardContent, modal)
import Bulma.Layout exposing (container, hero, section, heading)
import Bulma.Grid exposing (column)
import View.Loader exposing (loader)
import View.Header exposing (header, backButton)
import View.NotFoundPage exposing(notFoundPage)

type alias Props = {
  game: RemoteData Http.Error Game,
  user: RemoteData Http.Error User
}

gamePage : Props -> Html Msg
gamePage props =
    case RemoteData.map2 (,) props.game props.user of
      Loading -> loader
      Failure err -> notFoundPage
      Success (game, user) ->
        content_ {props | game = game, user = user}
      _ -> div "" []

content_ : {game: Game, user:User} -> Html Msg
content_ {user, game} =
  div "" [
    header "is-primary" game.title backButton,
    section "" [
      container "" [
        heading "" [
          title "is-4" [text "Players"]
        ],
        table "" [
          thead "" [
            tr "" [
              th "" [text "Name"],
              th "" [text "Score"]
            ]
          ],
          tbody "" <| List.map (playerScoreRow game.log) game.players
        ],
        link "button is-primary" ("/games/" ++ game.id ++ "/invite") [
          text "Invite Player"
        ]
      ]
    ],
    section "" [
      container "" [
        heading "" [
          title "is-4" [text "Activities"]
        ],
        column "" <| List.map activity game.activities,
        link
          "button is-primary"
          ("/games/" ++ game.id ++ "/activities/new")
        [ text "New Activity"]
      ]
    ]
  ]

activity : ActivityListItem -> Html Msg
activity activity =
  link
    "column"
    ("/activities/" ++ activity.id)
  [
    card "anim-fold-in" [
      cardContent "" [
        title "" [text activity.title],
        p "" [text activity.description]
      ]
    ]
  ]

playerScoreRow : List EventListItem -> User -> Html Msg
playerScoreRow log user =
  let
    score = List.foldl (+) 0 <| List.map .score <| List.filter (\{player} -> player == user.id) log
  in
    tr "" [
      td "" [ text <| user.firstName ++ " " ++ user.lastName ],
      td "" [text <| toString score]
    ]
