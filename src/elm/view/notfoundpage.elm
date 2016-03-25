module View.NotFoundPage where
import Html exposing (..)
import Html.Attributes exposing (..)

notFoundPage : Html
notFoundPage =
  div [class "card"]
    [ div [class "card-block"]
      [ h1 [] [text "404 page not found"]
      , p [] [text "This link does not seem to lead anywhere"]
      , p []
        [ text "try going back to "
        , a [href "#home"] [text "home"]
        ]
      ]
    ]
