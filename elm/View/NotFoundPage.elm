module View.NotFoundPage exposing (notFoundPage)
import Msg  exposing (Msg(..))
import Html exposing (Html, text)
import View.Header exposing (homeButton)
import Bulma exposing (div)
import Bulma.Elements exposing (title)
import Bulma.Components exposing (nav)
import Bulma.Layout exposing (hero)

notFoundPage : Html Msg
notFoundPage =
  div "" [
    nav "has-shadow" [homeButton],
    hero "" [
      title "" [text "Page Not Found"]
    ]
  ]
