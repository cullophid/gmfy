module View.NewActivityPage exposing (newActivityPage)
import Model exposing (ActivityForm)
import Html exposing (..)
import Html.Attributes exposing (value, href, class, type')
import Html.Events exposing (..)
import Msg exposing (..)



newActivityPage : ActivityForm -> Html Msg
newActivityPage {name, description, points} =
  text "HELLO WORLD"
