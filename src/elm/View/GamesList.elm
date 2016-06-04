module View.GamesList exposing (render)
import Html exposing (div, text, a)
import Html.Attributes exposing (class, href)
import View.Game as Game

render {games} =
  div [class "col-md-6 col-md-offset-3"]
    [ div [class "row"]
        [ div [class "list-group anim-stagger"]
            <| List.map Game.render games
        , a [class "fixed-bottom-right btn btn-success anim-from-right anim-delay-200", href "#/games/new"] [text "New Game"]
        ]
    ]
