module Util.List where
import Monocle.Lens exposing (Lens)

type alias HasId a =
  { a | id : String }

find : (a -> Bool) -> List a -> Maybe a
find f list =
  case list of
    [] -> Nothing
    x::xs -> if f(x) then Just x else find f xs

last = List.head << List.reverse


findById : String -> List (HasId a) -> Maybe (HasId a)
findById id list =
  find (\e -> e.id == id) list

updateById : String -> (HasId a -> HasId a) -> List (HasId a) -> List (HasId a)
updateById id f list =
  List.map (\e -> if e.id == id then f e else e) list

setById : String -> HasId a -> List (HasId a) -> List (HasId a)
setById id elem list =
  updateById id (always elem) list
