module Bulma.Layout exposing (..)

import Bulma.Util exposing (BasicComponent, basicDiv)
import Html exposing (a, Attribute, Html)
import Html.Attributes exposing (class)

hero : BasicComponent msg
hero classes children =
  Html.div [class ("hero " ++ classes)] [
    Html.div [class "hero-body"] children
  ]

container : BasicComponent msg
container = basicDiv "container"

section : BasicComponent msg
section = basicDiv "section"

heading : BasicComponent msg
heading = basicDiv "heading"
