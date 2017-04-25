module Api exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg exposing (Value, variable)
import GraphQL.Request.Builder.Variable as Var exposing (Variable)
import GQL
import Game exposing (GameForm, GameListItem, Game, GameMsg(..), gameSpec, gameListItemSpec, gameFormVar)
import InviteForm.Types exposing (InviteForm, InviteFormMsg(..))
import Event exposing (Event, eventListItemSpec)
import Activity exposing (ActivityMsg(..), Activity, ActivityForm, activitySpec, activityFormVar)
import App exposing (Msg(..))
import Util exposing (foldResult)


idVar : Value {a| id : String}
idVar = variable <| Var.required "id" .id Var.id

emailVar : Value {a| email : String}
emailVar = variable <| Var.required "email" .email Var.string

getGame : String -> Cmd Msg
getGame gameId =
  let
    gameRequest=
      extract (field "game" [("id", idVar)] gameSpec)
  in
    GQL.sendQuery gameRequest {id = gameId}
      |> Cmd.map (GameMsg << foldResult FetchGameFail FetchGameSuccess)

getGameList : Cmd Msg
getGameList =
  let
    gameListRequest =
      extract (field "games" [] (list gameListItemSpec))
  in
    GQL.sendQuery gameListRequest {}
      |> Cmd.map (GameMsg << foldResult FetchGameListFail FetchGameListSuccess)

createGame : GameForm -> Cmd Msg
createGame gameForm =
  let
    createGameRequest =
      extract (field "createGame" [ ("gameForm", variable gameFormVar)] gameSpec)
  in
    GQL.sendMutation createGameRequest {gameForm = gameForm}
      |> Cmd.map (GameMsg << foldResult CreateGameFail CreateGameSuccess)

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


completeActivity : String -> Cmd Msg
completeActivity activityId =
  let
    completeActivityRequest =
      extract (field "completeActivity" [("id", idVar)] eventListItemSpec)
  in
    GQL.sendMutation completeActivityRequest {id = activityId}
      |> Cmd.map (GameMsg << foldResult CompleteActivityFail CompleteActivitySuccess)

invitePlayer : String -> String -> Cmd Msg
invitePlayer gameId email =
  let
    mutation =
      extract (field "invitePlayer" [("gameId", idVar), ("email", emailVar)] string)
  in
    GQL.sendMutation mutation {email = email, id = gameId}
      |> Cmd.map (InviteFormMsg << foldResult InvitePlayerFail InvitePlayerSuccess)
