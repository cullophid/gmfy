module View.NewActivityPage exposing (newActivityPage)
import Html exposing (Html, text)
import Html.Attributes exposing (value, class, type_)
import Html.Events exposing (..)
import App.Data exposing (Msg(..))
import Activity.Data exposing (ActivityForm, ActivityMsg(..))
import Bulma exposing (div, link, back)
import Bulma.Elements exposing (title, submit, form, textInput, textArea, numberInput, field)
import Bulma.Layout exposing (container, hero, section)
import Bulma.Components exposing (card, cardContent, cardFooter)
import Bulma.Grid exposing (column)
import View.Header exposing (header, closeButton)


newActivityPage : ActivityForm -> Html Msg
newActivityPage activityForm =
  div "screen" [
    header "" "New Activity" closeButton,
    section "" [
      container "" [
       form_ activityForm
      ]
    ]
  ]

form_ : ActivityForm -> Html Msg
form_ activityForm =
  form "" (ActivityMsg <| SubmitActivity activityForm) [
    field "Title" <| textInput "" activityForm.title (ActivityMsg << ActivityTitle),
    field "Description" <| textArea "" activityForm.description (ActivityMsg << ActivityDescription),
    field "Points" <| numberInput "" activityForm.points (ActivityMsg << ActivityPoints),
    submit "button is-primary is-fullwidth" [text "Create Activity"]
  ]
