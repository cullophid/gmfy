module Event.Api exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg exposing (Value, variable)
import GraphQL.Request.Builder.Variable as Var exposing (Variable)
import GQL exposing (idVar, sendMutation, sendQuery)
import Event.Data exposing (EventMsg(..), eventListItemSpec)
import App.Data exposing (Msg(..))
import Util exposing (foldResult)

completeActivity : String -> Cmd Msg
completeActivity activityId =
  let
    completeActivityRequest =
      extract (field "completeActivity" [("id", idVar)] eventListItemSpec)
  in
    GQL.sendMutation completeActivityRequest {id = activityId}
      |> Cmd.map (EventMsg << foldResult CompleteActivityFail CompleteActivitySuccess)
