module Bulma.Elements exposing (..)

import Bulma.Util exposing (BasicComponent, basicDiv)
import Html exposing (Html, text)
import Html.Events exposing (onClick, onSubmit, onInput)
import Html.Attributes exposing (class, type_, value)
import String exposing (toInt)

notification : String -> msg -> List (Html msg) -> Html msg
notification classes onClose children =
  Html.div [class ("notification " ++ classes)] [
    Html.button [class "delete", onClick onClose] [],
    Html.div  [] children
  ]

icon : String -> String -> Html msg
icon classes iconClasses=
  Html.div [class ("icon " ++ classes) ] [
    Html.i [class ("fa " ++ iconClasses)] []
  ]

button: String -> msg -> List (Html msg) -> Html msg
button classes handler children =
  Html.button [class ("button " ++ classes), onClick handler] children

form: String -> msg -> List (Html msg) -> Html msg
form classes msg children =
  Html.form [class classes, onSubmit msg] children

submit : BasicComponent msg
submit classes children =
  Html.button [type_ "submit ", class classes] children

title: BasicComponent msg
title classes children =
  Html.h1 [class ("title " ++ classes)] children

tag: BasicComponent msg
tag classes children =
  Html.span [class ("tag " ++ classes)] children

table: BasicComponent msg
table classes children =
  Html.table [class ("table " ++ classes)] children


thead: BasicComponent msg
thead classes children =
  Html.thead [class ("thead " ++ classes)] children

tfoot: BasicComponent msg
tfoot classes children =
  Html.tfoot [class ("tfoot " ++ classes)] children

tbody: BasicComponent msg
tbody classes children =
  Html.tbody [class ("tbody " ++ classes)] children

tr: BasicComponent msg
tr classes children =
  Html.tr [class ("tr " ++ classes)] children

th: BasicComponent msg
th classes children =
  Html.th [class ("th " ++ classes)] children

td: BasicComponent msg
td classes children =
  Html.td [class ("td " ++ classes)] children

simpleTable : String -> List (Html msg) -> List (List (Html msg)) -> Html msg
simpleTable classes headers rows =
  table classes [
    thead "" [
      tr "" headers
    ],
    tbody "" <| List.map (tr "") rows
  ]
field : String -> Html msg -> Html msg
field label input =
  Html.div [class "field"] [
    Html.label [class "label"] [ text label],
    Html.p [class "control"] [
      input
    ]
  ]
textInput : String -> String -> (String -> msg) -> Html msg
textInput classes val msg =
  Html.input [type_ "text", value val, onInput msg, class ("input" ++ classes)] []

numberInput : String -> Int -> (Int -> msg) -> Html msg
numberInput classes val msg =
  Html.input [type_ "number", value (toString val), onInput (msg << (Result.withDefault 0) << toInt), class ("input" ++ classes)] []

textArea : String -> String -> (String -> msg) -> Html msg
textArea classes val msg =
  Html.textarea [value val, onInput msg, class ("textarea" ++ classes)] []
