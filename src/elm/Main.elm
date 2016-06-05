import Html.App as App
import Ports exposing (locationUpdate)
import Model exposing (Model, Msg(..), init)
import Update exposing (update)
import View exposing (view)

main : Program Never
main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

subscriptions : Model -> Sub Msg
subscriptions model =
  locationUpdate Location
