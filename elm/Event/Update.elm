module Event.Update exposing (update)
import App.Data exposing (Model, Msg(..))
import Event.Data exposing (Event, EventListItem,  EventMsg(..))
import Game.Data exposing (Game)
import Focus exposing (Focus, set, (=>))
import Util exposing (title_, description_, points_)
import RemoteData exposing (RemoteData(..))
import Navigation
import Event.Api as Api

update : EventMsg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    CompleteActivity activityId ->
      (model, Api.completeActivity activityId)
    CompleteActivityFail err ->
      ({model | error = Just err}, Cmd.none)
    CompleteActivitySuccess event ->
      ({model | game = RemoteData.map (addEvent event) model.game}, Navigation.newUrl ("/games/" ++ event.game))

addEvent : EventListItem -> Game -> Game
addEvent event game =
  {game | log = event :: game.log}
