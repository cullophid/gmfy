module Util.Dict where
import Dict exposing (Dict)
import Json.Encode exposing (object, Value)

encode : (a -> Value) -> Dict String a -> Value
encode enc dict =
   Dict.toList dict
     |> List.map (\(k,v) -> (k, enc v))
     |> object
