module Bulma.Components exposing (..)

import Bulma.Util exposing (BasicComponent, basicDiv)
import Html
import Html.Attributes exposing (class)

card : BasicComponent msg
card = basicDiv "card"

cardContent : BasicComponent msg
cardContent = basicDiv "card-content"

cardBlock : BasicComponent msg
cardBlock = basicDiv "card-block"

cardFooter : BasicComponent msg
cardFooter = basicDiv "card-footer"

nav : BasicComponent msg
nav = basicDiv "nav"

navLeft : BasicComponent msg
navLeft = basicDiv "nav-left"

navCenter : BasicComponent msg
navCenter = basicDiv "nav-center"

navRight : BasicComponent msg
navRight = basicDiv "nav-right"

navItem : BasicComponent msg
navItem = basicDiv "nav-item"

navToggle : BasicComponent msg
navToggle = basicDiv "nav-toggle"

level : BasicComponent msg
level = basicDiv "level"

levelLeft : BasicComponent msg
levelLeft = basicDiv "level-left"

levelRight : BasicComponent msg
levelRight = basicDiv "level-right"

modal : BasicComponent msg
modal classes children =
  Html.div [class "modal is-active"] [
    Html.div [class "modal-background"] [],
    Html.div [class ("modal-content " ++ classes)] children
  ]

modalWithClose : Bool -> BasicComponent msg
modalWithClose isActive classes children =
  Html.div [class ("modal" ++ if isActive then " is-active" else "")] [
    Html.div [class "modal-background"] [],
    Html.div [class ("modal-content " ++ classes)] children,
    Html.div [class "modal-close"] []
  ]

media : BasicComponent msg
media = basicDiv "media"

mediaLeft : BasicComponent msg
mediaLeft = basicDiv "media-left"

mediaContent : BasicComponent msg
mediaContent = basicDiv "media-content"

mediaRight : BasicComponent msg
mediaRight = basicDiv "media-right"
