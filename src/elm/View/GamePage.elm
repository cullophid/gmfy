module View.GamePage where
import Dict exposing (Dict)
import String
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Model)
import Model.Player exposing (Player)
import Model.Game exposing (Game)
import Model.Activity exposing (Activity)
import Actions exposing (..)
import Util.List exposing (last, findById, nth)
import Util.Router exposing (router, route)
import View.NotFoundPage exposing (notFoundPage)
import View.NewActivityForm exposing (newActivityForm)

gamePage : Model -> Html
gamePage  model =
  let
    {location, games, activityForm, user} =
      model
    gameId =
      Maybe.withDefault "missing" <| nth 1 (String.split "/" location)
    game' =
      Dict.get gameId games
    player' =
      Maybe.andThen game' (\{players} -> Dict.get user.id players)
    data =
      Maybe.map2 (\a b -> (a, b)) game' player'
  in
    case data of
      Just (game, player) ->
          showGamePage player game model
      _ -> notFoundPage

showGamePage : Player -> Game -> Model -> Html
showGamePage player game {location, showActivityForm, activityForm} =
  div [class "card"] [
    div [class "card-block"] [
      div [class "media"] [
        div [class "media-left"] [
          div [class "fa fa-gamepad fa-4x text-primary"] []
        ],
        div [class "media-body"] [
          h1 [] [text game.title],
          p [] [text game.description]
        ]
      ],
      nav [class "nav nav-inline"] [
        a [
          class "nav-link",
          href ("#games/" ++ game.id ++ "/activities")
        ] [
          text "Activities"
        ],
        a [
          class "nav-link",
          href ("#games/" ++ game.id ++ "/players")
        ]
        [text "Players"]
      ]
    ],
    router [
      route "#games/[0-9a-z|-]*/activities"
        <| (showActivities showActivityForm activityForm
        <| Dict.values game.activities),
      route "#games/[0-9a-z|-]*/players" (showPlayers <| Dict.values game.players)
    ] location
  ]

showActivities : Bool -> Activity -> List Activity -> Html
showActivities showActivityForm activityForm activities =
  div [class "card-block"] [
    div [class "list-group list-group-flush"]
      <| List.map activity activities,
    newActivityForm showActivityForm activityForm

  ]


activity : Activity -> Html
activity activity =
  div [class "list-group-item"]
    [ div [class "media"]
      [ div [class "media-left"]
        [ div [class "fa fa-3x fa-check-square-o text-primary"] []
        ]
      , div [class "media-body"]
      [ button
        [ class "btn btn-primary pull-xs-right pull-right"
        , onClick Actions.address (CompleteActivity activity)
        ] [text "Complete"]
        , h5 [] [text activity.title]
        , p [] [text activity.description]
        ]
      ]
    ]

showPlayers : List Player -> Html
showPlayers players =
  div [class "list-group list-group-flush"]
    <| List.map gamePlayer <| List.sortBy .score players


gamePlayer : Player -> Html
gamePlayer {name, score} =
    div [class "list-group-item"] [
      div [class "media"] [
        div [class "media-left"] [
          div [class "fa fa-3x fa-check-square-o text-primary"] []
        ],
        div [class "media-body"] [
          h5 [class "pull-xs-left"] [text name],
          h3 [class "pull-xs-right"] [
            p [class "label label-primary label-pill"] [text <| toString score]
          ]
        ]
      ]
    ]
