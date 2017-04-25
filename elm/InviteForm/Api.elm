module InviteForm.Api exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg exposing (Value, variable)
import GraphQL.Request.Builder.Variable as Var exposing (Variable)
import GQL exposing (emailVar, idVar, sendMutation, sendQuery)
import InviteForm.Data exposing (InviteForm, InviteFormMsg(..))
import App.Data exposing (Msg(..))
import Util exposing (foldResult)

invitePlayer : String -> String -> Cmd Msg
invitePlayer gameId email =
  let
    mutation =
      extract (field "invitePlayer" [("gameId", idVar), ("email", emailVar)] string)
  in
    GQL.sendMutation mutation {email = email, id = gameId}
      |> Cmd.map (InviteFormMsg << foldResult InvitePlayerFail InvitePlayerSuccess)
