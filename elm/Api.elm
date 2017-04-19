module Api exposing (..)
import Http
import Json.Decode exposing (Decoder, list)
import Game exposing (Game, GameForm, GameMsg(..), encodeGameForm, gameDecoder)
import Activity exposing (ActivityForm, ActivityMsg(..), encodeActivityForm, activityDecoder)
import Event exposing (Event, EventMsg(..), eventDecoder, encodeEvent)
import App exposing (Msg(..))
import Util exposing (foldResult)


send : (a -> Msg) -> (Http.Error -> a) -> (res -> a) -> Http.Request res -> Cmd Msg
send msg fail success req =
  Http.send (foldResult (msg << fail) (msg << success)) req


createGame : GameForm -> Cmd Msg
createGame game =
  let
      body = Http.jsonBody <| encodeGameForm game
  in
    send GameMsg CreateGameFail CreateGameSuccess <| Http.post "/api/games" body gameDecoder

getGameList : Cmd Msg
getGameList =
  send GameMsg FetchGamesFail FetchGamesSuccess <| Http.get "/api/games" (list gameDecoder)


createActivity : String -> ActivityForm -> Cmd Msg
createActivity gameId activity =
  let
      body = Http.jsonBody <| encodeActivityForm activity
  in
    send ActivityMsg CreateActivityFail CreateActivitySuccess
      <| Http.post ("/api/games/" ++ gameId ++ "/activities") body activityDecoder

getGameActivities : String -> Cmd Msg
getGameActivities gameId =
  send ActivityMsg FetchActivitiesFail FetchActivitiesSuccess
    <| Http.get ("/api/games/" ++ gameId ++ "/activities") <| list activityDecoder

getGameEvents : String -> Cmd Msg
getGameEvents gameId =
  send EventMsg FetchEventsFail FetchEventsSuccess
    <| Http.get ("/api/games/" ++ gameId ++ "/events") <| list eventDecoder

completeActivity : String -> Cmd Msg
completeActivity activityId =
  send EventMsg CreateEventFail CreateEventSuccess
    <| Http.post ("/api/activities/" ++ activityId ++ "/complete") Http.emptyBody eventDecoder
