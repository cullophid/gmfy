module Event exposing (..)

import Json.Decode as Decode exposing (Decoder, field, string, map6)
import Json.Encode as Encode exposing (Value)
import Util exposing (dateDecoder)
import RemoteData exposing (WebData)
import Date exposing (Date)
import Http
import Dict exposing (Dict)

type EventType = ActivityCompleted

type alias Event = {
  id: String,
  eventType: EventType,
  user: String,
  game: String,
  activity: String,
  time: Date
}

type alias Events = WebData (Dict String Event)

type EventMsg =
    FetchEventsFail Http.Error
  | FetchEventsSuccess (List Event)
  | CreateEventSuccess Event
  | CreateEventFail Http.Error


encodeEvent : Event -> Value
encodeEvent {eventType, activity} =
  Encode.object [
    ("type", Encode.string <| toString eventType),
    ("activity", Encode.string activity)
  ]

eventTypeDecoder : Decoder EventType
eventTypeDecoder =
  let
    decode eventType =
      case eventType of
        "ActivityCompleted" -> Decode.succeed ActivityCompleted
        _ -> Decode.fail "Invalid EventType"
  in
    Decode.andThen decode string

eventDecoder: Decoder Event
eventDecoder = map6 Event
  (field "id" string)
  (field "type" eventTypeDecoder)
  (field "user" string)
  (field "game" string)
  (field "activity" string)
  (field "time" dateDecoder)
