module Update.Event exposing (update)

import App exposing (Model, Msg)
import Event exposing (EventMsg(..))
import Util exposing (indexWith)
import RemoteData exposing (RemoteData(..))
import Dict

update : EventMsg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    FetchEventsFail err ->
      ({model | events = Failure err}, Cmd.none)
    FetchEventsSuccess events ->
      ({model | events = Success <| indexWith .id events }, Cmd.none)
    CreateEventFail err ->
      ({model | error = Just err}, Cmd.none)
    CreateEventSuccess event ->
      ({model | events = RemoteData.map (Dict.insert event.id event) model.events}, Cmd.none)
