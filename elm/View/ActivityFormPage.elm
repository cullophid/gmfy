module View.ActivityFormPage exposing (activityFormPage)
import Html exposing (Html, div, form, h1, h2, text, label, input, textarea, button)
import Html.Attributes exposing (value, class, type_)
import Html.Events exposing (..)
import App exposing (Msg(..))
import Route exposing (Route(..))
import Activity exposing (ActivityForm, ActivityMsg(..))
import View.Link exposing (link, back)
import String exposing (toInt)



activityFormPage : Route -> ActivityForm -> Html Msg
activityFormPage route activityForm =
  case route of
    NewActivityRoute gameId ->
      div [class "page-overlay page-overlay-show bg-success"] [ content gameId activityForm ]
    _ ->
      div [class "page-overlay page-overlay-hide bg-success"] [ content "" activityForm ]

content : String -> ActivityForm -> Html Msg
content gameId activityForm =
  div [class "col-md-6 col-md-offset-3 full-height"] [
      Html.map ActivityMsg <| renderActivityForm gameId activityForm,
      div [ class "row flex-grow-0 gutter-top gutter-bottom"] [
        div [class "col-xs-6"] [
          back [class "btn btn-white-outline btn-block"] [ text "cancel"]
        ],
        div [class "col-xs-6"] [
          button [
            type_ "submit",
            class "btn btn-white-outline btn-block "
          ] [text "Create Activity"]
        ]
      ]
    ]
renderActivityForm : String -> ActivityForm -> Html ActivityMsg
renderActivityForm gameId activityForm =
  form [onSubmit (SubmitActivity gameId activityForm), class "full-height flex-column"] [
    div [class "flex-grow-1 large-gutter-top"] [
      h1 [] [text "New Activity"],
      div [class "form-group"] [
        label [] [text "Title"],
        input [
          class "form-control",
          value activityForm.title,
          onInput ActivityTitle
        ] []
      ],
      div [class "form-group"] [
        label [] [text "Description"],
        textarea [
          class "form-control",
          value activityForm.description,
          onInput ActivityDescription
        ] []
      ],
      div [class "form-group"] [
        label [] [text "Points"],
        input [
          type_ "number",
          class "form-control",
          value <| toString activityForm.points,
          onInput (ActivityPoints << (Result.withDefault 0) << toInt)
        ] []
      ]
    ]
  ]
