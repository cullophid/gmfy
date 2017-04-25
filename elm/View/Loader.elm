module View.Loader exposing (..)
import App.Data exposing (Msg)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

loader : Html Msg
loader = div [class "loader"] []

loadingScreen : String -> Html Msg
loadingScreen msg =
  div [class "loader-overlay"] [
    loader,
    text msg
  ]
