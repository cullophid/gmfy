import View exposing (view)
import App exposing (Model, Msg(..), emptyModel)
import App.Update exposing (update)
import Navigation exposing (Location)
import Route.Update as Route

main : Program Never Model Msg
main =
  Navigation.program UrlChange
    {
    init = init,
    view = view,
    update = update,
    subscriptions = subscriptions
    }

init: Location -> (Model, Cmd Msg)
init location =
  Route.update location emptyModel

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
