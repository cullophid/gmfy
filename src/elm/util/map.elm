module Util.Map where


get : k -> List (k, v) -> Maybe v
get key list =
  case list of
    [] -> Nothing
    (k, v)::xs ->
      if key == k then Just v else get key xs

update : k -> (v -> v) -> List (k, v) -> List (k, v)
update key f list =
  case list of
    [] ->
      list
    (k, v)::xs ->
      if k == key then (k, f v) :: xs else (k, v) :: update key f xs
