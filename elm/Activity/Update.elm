module Activity.Update exposing (update)
import App exposing (Model, Msg(..))
import Activity exposing (Activity, ActivityMsg(..))
import Focus exposing (Focus, set, (=>))
import Util exposing (title_, description_, points_)
import RemoteData exposing (RemoteData(..))
import Navigation
import Api

activityForm_ : Focus {a | activityForm: b} b
activityForm_ = Focus.create .activityForm (\f x -> {x | activityForm = f x.activityForm})

update : ActivityMsg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    ActivityTitle title ->
      (set (activityForm_ => title_) title model, Cmd.none)
    ActivityDescription description ->
      (set (activityForm_ => description_) description model, Cmd.none)
    ActivityPoints points ->
      (set (activityForm_ => points_) points model, Cmd.none)
    SubmitActivity activityForm ->
      (model , Api.createActivity activityForm)
    CompleteActivity activityId ->
      (model, Api.completeActivity activityId)
    CreateActivityFail err ->
      ({model | activity = Failure err}, Cmd.none)
    CreateActivitySuccess activity ->
      ({model | activity = Success activity}, Navigation.newUrl <| "/games/" ++ activity.game.id)
    GetActivityFail err ->
      ({model | activity = Failure err}, Cmd.none)
    GetActivitySuccess activity ->
      ({model | activity = Success activity}, Cmd.none)
