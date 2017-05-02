module View.Tabs exposing (tabs, Tab)

import Msg exposing (Msg(..))
import Html exposing (Html, text)
import Html.Attributes exposing (class, href)
import Bulma.Elements exposing (sublink)

type alias Tab msg = {
  key: String,
  header: Html msg,
  body: Html msg
  }

tabs : String -> String -> List (Tab Msg) -> Html Msg
tabs classes selected tabs =
  let
    renderHeader selected {key, header} =
      Html.li [ class (if selected == key then "is-active" else "")] [
        sublink "" key [header]
        ]
    renderBody selected {key, body} =
      if key == selected then body else text ""
  in
    Html.div [] [
      Html.div [class ("tabs " ++ classes)] [
        Html.ul [] <| List.map (renderHeader selected) tabs
      ],
      Html.div [] <| List.map (renderBody selected) tabs
    ]
