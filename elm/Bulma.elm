module Bulma exposing (..)

import Html exposing (a, Attribute, Html)
import Html.Events exposing (Options, onWithOptions, onClick)
import Html.Attributes exposing (class, type_, src)
import Msg exposing (Msg(..))




node : (List (Attribute msg) -> List (Html msg) -> Html msg) -> String -> List (Html msg) -> Html msg
node elem classes children =
  elem [class classes] children

div : String -> List (Html msg) -> Html msg
div = node Html.div

p : String -> List (Html msg) -> Html msg
p = node Html.p

span : String -> List (Html msg) -> Html msg
span = node Html.span
