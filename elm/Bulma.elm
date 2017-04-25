module Bulma exposing (..)

import Html exposing (a, Attribute, Html)
import Html.Events exposing (Options, onWithOptions, onClick)
import Html.Attributes exposing (class, type_)
import App exposing (Msg(..))
import Json.Decode as Decode

options : Options
options = { stopPropagation = True , preventDefault = True }

link : String -> String -> List (Html Msg) -> Html Msg
link classes href children =
  let
    clickHandler = onWithOptions "click" options (Decode.succeed <| Navigate href)
  in
    a [class classes, clickHandler] children

back : String -> List (Html Msg) -> Html Msg
back classes children =
  let
    options = { stopPropagation = True , preventDefault = True }
    click = onWithOptions "click" options (Decode.succeed <| Back)
  in
    a [class classes, click] children

node : (List (Attribute msg) -> List (Html msg) -> Html msg) -> String -> List (Html msg) -> Html msg
node elem classes children =
  elem [class classes] children

div : String -> List (Html msg) -> Html msg
div = node Html.div

p : String -> List (Html msg) -> Html msg
p = node Html.p

span : String -> List (Html msg) -> Html msg
span = node Html.span
