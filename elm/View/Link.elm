module View.Link exposing (link, back)
import Html exposing (a, Attribute, Html)
import Html.Events exposing (Options, onWithOptions)
import Html.Attributes exposing (href)
import App exposing (Msg(..))
import Json.Decode as Decode

options : Options
options = { stopPropagation = True , preventDefault = True }


link : String -> List (Attribute Msg) -> List (Html Msg) -> Html Msg
link to props children =
  let
    onClick = onWithOptions "click" options (Decode.succeed <| Navigate to)
  in
    a (onClick :: href "#" :: props) children

back : List (Attribute Msg) -> List (Html Msg) -> Html Msg
back props children =
  let
    options = { stopPropagation = True , preventDefault = True }
    onClick = onWithOptions "click" options (Decode.succeed <| Back)
  in
    a (onClick :: href "#" :: props) children
