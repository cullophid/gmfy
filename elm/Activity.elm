module Activity exposing (..)

import Json.Encode as Encode
import Json.Decode exposing (Decoder, field, string, int, map5)

import RemoteData exposing (WebData)
import Dict exposing (Dict)
import Http

type alias Activities = WebData (Dict String Activity)

type alias Activity = {
  id: String,
  title: String,
  description: String,
  game: String,
  points: Int
}

type alias ActivityForm = {
  title : String,
  description: String,
  points: Int
  }

type ActivityMsg =
    ActivityTitle String
  | ActivityDescription String
  | ActivityPoints Int
  | CompleteActivity String
  | SubmitActivity String ActivityForm
  | CreateActivityFail Http.Error
  | CreateActivitySuccess Activity
  | FetchActivitiesFail Http.Error
  | FetchActivitiesSuccess (List Activity)

activityDecoder : Decoder Activity
activityDecoder = map5 Activity
  (field "id" string)
  (field "title" string)
  (field "description" string)
  (field "game" string)
  (field "points" int)



emptyActivityForm : ActivityForm
emptyActivityForm = {
  title = "",
  description = "",
  points = 10
  }

encodeActivityForm : ActivityForm -> Encode.Value
encodeActivityForm activityForm =
  Encode.object [
    ("title", Encode.string activityForm.title),
    ("description", Encode.string activityForm.description),
    ("points", Encode.int activityForm.points)
  ]
