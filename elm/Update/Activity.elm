module Update.Activity exposing (update)
import App exposing (Model, Msg(..))
import Activity exposing (Activity, ActivityMsg(..))
import Focus exposing (Focus, set, (=>))
import Util exposing (indexWith, title_, description_, points_)
import Api
import RemoteData exposing (RemoteData(..))
import Dict
import Navigation

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
    SubmitActivity gameId activityForm ->
      (model , Api.createActivity gameId activityForm)
    CompleteActivity activityId ->
      (model, Api.completeActivity activityId)
    CreateActivityFail err ->
      ({model | error = Just err}, Cmd.none)
    CreateActivitySuccess activity ->
      ({model |
        activities = RemoteData.map (Dict.insert activity.id activity) model.activities
      }, Navigation.newUrl <| "/games/" ++ activity.game)
    FetchActivitiesFail err ->
      ({model| activities = Failure err}, Cmd.none)
    FetchActivitiesSuccess activities ->
      ({ model | activities = RemoteData.succeed <| indexWith .id activities}, Cmd.none)
