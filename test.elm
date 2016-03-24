module Test where
import Html exposing (..)


type alias Map k v =
  List (k, v)


startMap : Map String String
startMap =
  [("key", "value")]


get : k -> Map k v ->  Maybe v
get key map =
  case map of
    [] -> Nothing
    (k, v)::xs ->
      if key == k then Just v else get key xs


set : k -> v -> Map k v -> Map k v
set k v map =
  case map of
    [] -> [(k, v)]
    x::xs ->
      if (fst x) == k then (k, v)::xs else x::(set k v xs)


keys : Map k v -> List v
keys map =
  List.map (\(k, _) -> k) map


map : (k, v -> v) -> Map k v -> Map k v
map f map =
  List.map (\(k, v) -> (k, f k v)) map


values : Map k v -> List v
values map =
  List.map (\(_, v) -> v) map


mymap =
  startMap
  |> set "1" "one"
  |> set "2" "two"
  |> set "3" "three"
  |> set "4" "four"
  |> set "2" "psych"
  |> map (\k v -> v ++ "!")


main =
  text <| Maybe.withDefault "default" <| get "3" mymap
