module View.List exposing (list, listItem)

import Html exposing (Html)
import Html.Attributes exposing (class)

list : String -> List (Html msg) -> Html msg
list classes children=
  Html.div [class ("list-group " ++ classes)] children

listItem : String -> List (Html msg) -> Html msg
listItem classes children=
  Html.div [class ("list-group-item " ++ classes)] children
