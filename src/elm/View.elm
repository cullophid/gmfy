module View exposing (view)
import Html exposing (Html, div, text)
import Model exposing (..)
import View.GamesList as GamesList

view : Model -> Html Msg
view model =
  GamesList.render model
