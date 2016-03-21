module Components.Router where
import Html exposing (Html, text)
import Regex exposing (regex, contains)
import Util.List exposing (find)

route : String -> Html -> String -> Maybe Html
route path content location =
  if contains (regex path) location then Just content else Nothing

router : List (String -> Maybe Html) -> String -> Html
router routes location =
  let
    r = flatten <| find isJust <| List.map (\r -> r location) routes
  in
    case r of
      Just html -> html
      _ -> text ""

isJust : Maybe a -> Bool
isJust a =
  case a of
    Just _ -> True
    _ -> False

flatten : Maybe (Maybe a) -> Maybe a
flatten a =
  case a of
    Just v -> v
    _ -> Nothing
