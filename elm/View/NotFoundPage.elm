module View.NotFoundPage exposing (notFoundPage)
import App  exposing (Msg)
import Html exposing (Html)
import View.Header exposing (header, homeButton)

notFoundPage : Html Msg
notFoundPage =
  header "is-danger" "Page Not Found" homeButton
