module Activity.Api exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg exposing (Value, variable)
import GraphQL.Request.Builder.Variable as Var exposing (Variable)
import GQL exposing (idVar, sendMutation, sendQuery)
import Activity.Data exposing (ActivityMsg(..), Activity, ActivityForm, activitySpec, activityFormVar)
import App.Data exposing (Msg(..))
import Util exposing (foldResult)

createActivity : ActivityForm -> Cmd Msg
createActivity activityForm =
  extract (field "createActivity" [ ("activityForm", variable activityFormVar)] activitySpec)
    |> flip GQL.sendMutation {activityForm = activityForm}
    |> Cmd.map (ActivityMsg << foldResult CreateActivityFail CreateActivitySuccess)


getActivity : String -> Cmd Msg
getActivity activityId =
  let
    getActivityRequest =
      extract (field "activity" [("id", idVar)] activitySpec)
  in
    GQL.sendQuery getActivityRequest {id = activityId}
      |> Cmd.map (ActivityMsg << foldResult GetActivityFail GetActivitySuccess)
