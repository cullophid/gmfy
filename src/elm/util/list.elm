module Util.List where

find : (a -> Bool) -> List a -> Maybe a
find f list =
  case list of
    [] -> Nothing
    x::xs -> if f(x) then Just x else find f xs

last = List.head << List.reverse
