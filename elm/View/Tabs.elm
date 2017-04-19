module View.Tabs exposing (tabs, Tab(..))

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import App exposing (Msg)
import View.Link exposing (link)
import Util exposing (indexWith)
import Dict

type Tab = Tab String (Html Msg)

tabs : String -> List Tab -> Html Msg
tabs selected tablist =
  let
      dict = indexWith (\(Tab name _) -> name) tablist
      a = Debug.log "selected" selected
  in
    div [class "tabs"] [
      div [class "tabs-headers"] <| List.map (tabHeader selected) tablist,
      Maybe.withDefault (div [][ text "Nope"]) <| Maybe.map (\(Tab _ html) -> html) <| Dict.get selected dict
    ]

tabHeader : String -> Tab -> Html Msg
tabHeader selected (Tab name _) =
  let
      className = class <| "tabs-header btn btn-default" ++ if selected == name then " tabs-selected" else ""
  in
    link ("#" ++ name) [className] [text name]
