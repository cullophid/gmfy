module Bulma.Util exposing (..)

import Html exposing (a, Attribute, Html)
import Html.Attributes exposing (class, type_)

type alias BasicComponent msg = String -> List (Html msg) -> Html msg

basicDiv : String -> BasicComponent msg
basicDiv baseClass classes =
  Html.div [class (baseClass ++ " " ++ classes)]
