module View.Header exposing (..)
import Html exposing (Html,text)
import App exposing (Msg)
import Bulma exposing (link, back, div)
import Bulma.Elements exposing (title, icon)
import Bulma.Grid exposing (column)
import Bulma.Layout exposing (hero, container)

header : String -> String -> Html msg -> Html msg
header classes headerTitle iconButton =
  div "" [
    column classes [
      iconButton
    ],
    hero "" [
      container "" [
        title "" [text headerTitle]
      ]
    ]
  ]

backButton : Html Msg
backButton =
  back "" [
    icon "is-medium" "fa-angle-left"
  ]

closeButton : Html Msg
closeButton =
  back "" [
    icon "is-medium" "fa-close"
  ]


homeButton : Html Msg
homeButton =
  link "" "/" [
    icon "is-medium" "fa-home"
  ]
