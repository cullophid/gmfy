module View.Header exposing (header)
import Html exposing (..)

header : String -> Html Msg
header title =
  div [] [
    h1 [] [ text title ]
  ]
