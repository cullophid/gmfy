module View exposing (view)
import Model exposing (..)
import Html exposing (Html, div, text)
import View.GamesList as GamesList
import View.Header as Header


view : Model -> Html Msg
view model =
  div [] [
    Header.render "Games",
    GamesList.render model
  ]
