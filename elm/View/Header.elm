module View.Header exposing (..)
import Html exposing (Html,text)
import Msg exposing (Msg(..))
import Bulma exposing (div)
import Bulma.Elements exposing (title, icon, button, link, back)
import Bulma.Components exposing (nav)
import Bulma.Grid exposing (column)
import Bulma.Layout exposing (hero, container)
import Html
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

backButton : Html Msg
backButton =
  div "nav-left" [
    back "nav-item" [
      icon "is-medium" "fa-angle-left"
    ]
  ]

closeButton : Html Msg
closeButton =
  div "nav-left" [
    back "nav-item  is-primary" [
      icon "is-medium" "fa-close"
    ]
    ]


homeButton : Html Msg
homeButton =
  div "nav-left" [
    link "nav-item" "/" [
      icon "is-medium" "fa-home"
    ]
  ]

signoutButton : Html Msg
signoutButton =
  div "nav-left" [
    Html.a [class "nav-item is-inverted is-primary", onClick Logout] [
      icon "is-medium" "fa-power-off"
    ]
  ]
