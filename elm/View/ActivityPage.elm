module View.ActivityPage exposing (activityPage)

import App exposing (Msg)
import Route exposing (Route(..))
import Activity exposing (Activities)
import Html exposing (Html, div)

activityPage : Route -> Activities -> Html Msg
activityPage route activities = div [] []
