module View exposing (view)
import Html exposing (Html, div, text)
import Model exposing (..)
import View.GamesList as GamesList
import View.Header as Header

view : Model -> Html Msg
view model =
  div [] [
    Header.render "Games",
    GamesList.render model
  ]
