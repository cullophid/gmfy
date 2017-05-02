module Api exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg exposing (Value, variable)
import GraphQL.Request.Builder.Variable as Var exposing (Variable)
import GraphQL.Client.Http exposing (Error(..))
import GQL exposing (idVar, emailVar, sendMutation, sendQuery)
import Activity exposing (Activity, ActivityForm, activitySpec, activityFormVar)
import Game exposing (GameForm, gameSpec, gameListItemSpec, gameFormVar)
import User exposing (userSpec, userDecoder)
import Event exposing (eventListItemSpec)
import Msg exposing (Msg(..))
import Util exposing (foldResult)
import Http
import Navigation exposing (Location)
import Json.Encode as Encode
import Json.Decode as Decode


fetchSession : Location -> Cmd Msg
fetchSession successRedirect =
  let
    fetchSessionRequest =
      extract (field "session" [] userSpec)
  in
    GQL.sendQuery fetchSessionRequest {}
      |> Cmd.map (foldResult FetchSessionFail (FetchSessionSuccess successRedirect))

createActivity : ActivityForm -> Cmd Msg
createActivity activityForm =
  extract (field "createActivity" [ ("activityForm", variable activityFormVar)] activitySpec)
    |> flip GQL.sendMutation {activityForm = activityForm}
    |> Cmd.map (foldResult CreateActivityFail CreateActivitySuccess)


getActivity : String -> Cmd Msg
getActivity activityId =
  let
    getActivityRequest =
      extract (field "activity" [("id", idVar)] activitySpec)
  in
    GQL.sendQuery getActivityRequest {id = activityId}
      |> Cmd.map (foldResult FetchActivityFail FetchActivitySuccess)

sendAuthEmail : String -> Cmd Msg
sendAuthEmail email =
  let
      body = Http.jsonBody
        <| Encode.object [
            ("email", Encode.string email)
          ]
  in
    Http.post "/api/auth" body (Decode.succeed "ok")
      |> Http.send (foldResult (SendAuthEmailFail << HttpError) SendAuthEmailSuccess)

validateToken : String -> Cmd Msg
validateToken token =
  let
    body = Http.jsonBody
      <| Encode.object [
          ("token", Encode.string token)
        ]
  in
    Http.post "/api/login" body userDecoder
      |> Http.send (foldResult (LoginFail << HttpError) LoginSuccess)
      |> Debug.log "WTF"

completeActivity : String -> Cmd Msg
completeActivity activityId =
  let
    completeActivityRequest =
      extract (field "completeActivity" [("id", idVar)] eventListItemSpec)
  in
    GQL.sendMutation completeActivityRequest {id = activityId}
      |> Cmd.map (foldResult CompleteActivityFail CompleteActivitySuccess)

getGame : String -> Cmd Msg
getGame gameId =
  let
    gameRequest=
      extract (field "game" [("id", idVar)] gameSpec)
  in
    sendQuery gameRequest {id = gameId}
      |> Cmd.map (foldResult FetchGameFail FetchGameSuccess)

getGameList : Cmd Msg
getGameList =
  let
    gameListRequest =
      extract (field "games" [] (list gameListItemSpec))
  in
    sendQuery gameListRequest {}
      |> Cmd.map (foldResult FetchGameListFail FetchGameListSuccess)

createGame : GameForm -> Cmd Msg
createGame gameForm =
  let
    createGameRequest =
      extract (field "createGame" [ ("gameForm", variable gameFormVar)] gameSpec)
  in
    sendMutation createGameRequest {gameForm = gameForm}
      |> Cmd.map (foldResult CreateGameFail CreateGameSuccess)

invitePlayer : String -> String -> Cmd Msg
invitePlayer gameId email =
  let
    mutation =
      extract (field "invitePlayer" [("gameId", idVar), ("email", emailVar)] string)
  in
    GQL.sendMutation mutation {email = email, id = gameId}
      |> Cmd.map (foldResult InvitePlayerFail InvitePlayerSuccess)
