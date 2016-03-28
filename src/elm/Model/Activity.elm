module Model.Activity where
import Json.Encode exposing (Value)
import Json.Decode exposing (Decoder, (:=))

type alias Activity =
  { id : String
  , title : String
  , description : String
  , value : Int
  }



emptyActivity : Activity
emptyActivity =
  { id = ""
  , title = ""
  , description = ""
  , value = 10
  }

encode : Activity -> Value
encode activity =
  Json.Encode.object [
    ("id", Json.Encode.string activity.id),
    ("title", Json.Encode.string activity.title),
    ("description", Json.Encode.string activity.description),
    ("value", Json.Encode.int activity.value)
  ]

decoder : Decoder Activity
decoder =
  Json.Decode.object4
    Activity
    ("id" := Json.Decode.string)
    ("title" := Json.Decode.string)
    ("description" := Json.Decode.string)
    ("value" := Json.Decode.int)
