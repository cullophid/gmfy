module View.NotFoundPage where
import Html exposing (..)
import Html.Attributes exposing (..)
import View.Header as Header

notFoundPage : Html
notFoundPage =
  div [] [
    Header.header "Not Found",
    div [ class "col-md-6 col-md-offset-3"] [
      div [] [
        h1 [] [text "404 page not found"],
        p [] [text "This link does not seem to lead anywhere"],
        p [] [
          text "try going back to ",
          a [href "/#/"] [text "home"]
        ]
      ]
    ]
  ]
