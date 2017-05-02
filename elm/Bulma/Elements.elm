module Bulma.Elements exposing (..)

import Bulma.Util exposing (BasicComponent, basicDiv)
import Html exposing (Html, text)
import Html.Events exposing (Options, onWithOptions, onClick, onSubmit, onInput)
import Html.Attributes exposing (class, type_, value, src)
import String exposing (toInt)
import Json.Decode as Decode
import Msg exposing (Msg(..))

options : Options
options = { stopPropagation = True , preventDefault = True }

link : String -> String -> List (Html Msg) -> Html Msg
link classes href children =
  let
    clickHandler = onWithOptions "click" options (Decode.succeed <| NewUrl href)
  in
    Html.a [class classes, clickHandler] children

back : String -> List (Html Msg) -> Html Msg
back classes children =
  let
    options = { stopPropagation = True , preventDefault = True }
    click = onWithOptions "click" options (Decode.succeed <| Back)
  in
    Html.a [class classes, click] children

sublink : String -> String -> List (Html Msg) -> Html Msg
sublink classes href children =
  let
    clickHandler = onWithOptions "click" options (Decode.succeed <| ModifyUrl href)
  in
    Html.a [class classes, clickHandler] children

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
button classes msg children =
  let
      clickHandler = onWithOptions "click" options (Decode.succeed <| msg)
  in
    Html.button [class ("button " ++ classes), clickHandler] children

form: String -> msg -> List (Html msg) -> Html msg
form classes msg children =
  Html.form [class classes, onSubmit msg] children

submit : BasicComponent msg
submit classes children =
  Html.button [type_ "submit ", class classes] children

title: BasicComponent msg
title classes children =
  Html.h1 [class ("title " ++ classes)] children

subtitle: BasicComponent msg
subtitle classes children =
  Html.p [class ("subtitle " ++ classes)] children

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

image : String -> String -> Html msg
image classes src_ =
  Html.figure [class ("image " ++ classes)] [
    Html.img [src src_] []
  ]

scrollpane classes children =
  Html.div [class ("scrollpane " ++ classes)] children
