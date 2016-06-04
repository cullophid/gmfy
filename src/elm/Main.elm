import Html exposing (Html, input, p, text, div)
import Html.Attributes exposing (class, value)
import Html.App as App
import Html.Events exposing (onInput)
import Model exposing (Model, Msg, init)
import Update exposing (update)
import View exposing (view)

main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

subscriptions model =
  Sub.none
