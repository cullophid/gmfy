import View exposing (view)
import App exposing (Model, emptyModel)
import Msg exposing(Msg(..))
import Update exposing (update)
import Navigation exposing (Location)
import RemoteData exposing (RemoteData(..))
import Api
import Router

main : Program Never Model Msg
main =
  Navigation.program UrlChange
    {
    init = init,
    view = view,
    update = update << Debug.log "Msg",
    subscriptions = subscriptions
    }

init: Location -> (Model, Cmd Msg)
init location =
  Router.update location emptyModel

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
