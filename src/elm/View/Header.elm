module View.Header where

import Html exposing (..)
import Html.Attributes exposing (class, href)

header : Html
header =
  nav [class "navbar navbar-dark bg-primary"]
    [ a [class "navbar-brand", href "#home"] [text "GMFY"]
    , ul [class "nav navbar-nav"]
      [ li [class "nav-item"]
        [ a
          [ class "nav-link link-white"
          , href "#"
          ] [text "home"]
        ]
        , li [class "nav-item"]
          [ a
            [ class "nav-link link-white"
            , href "#games"
            ] [text "games"]
          ]
        ]
        , form [class "form-inline pull-xs-right"]
          [ a
            [ class "btn btn-white-outline"
            , href "#games/new"
            ] [text "New Game"]
          ]
        ]
