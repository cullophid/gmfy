module Event exposing (..)

import Date exposing (Date)
import GraphQL.Request.Builder exposing (..)

type EventType = ActivityCompleted

type alias EventListItem = {
  id: String,
  eventType: EventType,
  player: String,
  game: String,
  score: Int
}

type alias Event = {
  id: String,
  eventType: EventType,
  user: String,
  score: Int,
  game: String,
  activity: String,
  time: Date
}
eventTypeSpec : ValueSpec NonNull EnumType EventType vars
eventTypeSpec =
  enum [
    ("ACTIVITY_COMPLETED", ActivityCompleted)
  ]

eventListItemSpec : ValueSpec NonNull ObjectType EventListItem vars
eventListItemSpec = object EventListItem
  |> with (field "id" [] string)
  |> with (field "type" [] eventTypeSpec)
  |> with (field "_player" [] string)
  |> with (field "_game" [] string)
  |> with (field "score" [] int)
