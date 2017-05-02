module View.NewActivityPage exposing (newActivityPage)
import Html exposing (Html, text)
import Html.Attributes exposing (value, class, type_)
import Html.Events exposing (..)
import Msg exposing (Msg(..))
import Activity exposing (ActivityForm)
import Bulma exposing (div)
import Bulma.Elements exposing (title, submit, form, textInput, textArea, numberInput, field, button, image, link, back)
import Bulma.Layout exposing (container, hero, section)
import Bulma.Components exposing (card, cardContent, cardFooter, nav)
import Bulma.Grid exposing (column, columns)
import View.Header exposing (closeButton)
import View.IconPicker as IconPicker

setTitle model title = {model | title  = title}
setDescription model description = {model | description  = description}
setPoints model points = {model | points  = points}

newActivityPage : ActivityForm -> Html Msg
newActivityPage activityForm =
  div "screen" [
    nav "has-shadow" [closeButton],
    hero "" [
      container "" [
        title "" [text "New Activity"]
      ]
    ],
    section "" [
      container "" [
        columns "" [
          column "" [
            iconPicker activityForm
          ],
          column "" [
            form_ activityForm
          ]
        ]
      ]
    ]
  ]

iconPicker activityForm =
  let
      onIconSelect = \icon -> UpdateActivityForm {activityForm | icon = icon, showIconPicker = False}
      showIconPicker = UpdateActivityForm {activityForm| showIconPicker = True}
  in
    case activityForm.showIconPicker of
      True ->
        IconPicker.render onIconSelect
      False ->
        button "is-image" showIconPicker [
          image "is-48x48" activityForm.icon
        ]

form_ : ActivityForm -> Html Msg
form_ activityForm =
  let
    setTitle title = UpdateActivityForm {activityForm | title  = title}
    setDescription description = UpdateActivityForm {activityForm | description  = description}
    setPoints points = UpdateActivityForm {activityForm | points  = points}
  in
  form "" (CreateActivity activityForm) [
    field "Title" <| textInput "" activityForm.title (setTitle),
    field "Description" <| textArea "" activityForm.description (setDescription),
    field "Points" <| numberInput "" activityForm.points (setPoints),
    submit "button is-primary is-fullwidth" [text "Create Activity"]
  ]
