module Components.Route where
import Html exposing (Html, text)

route : String -> Html -> String -> Html
route path content location =
  if path == location then content else text ""
