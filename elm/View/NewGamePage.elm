module View.NewGamePage exposing (newGamePage)
import Msg exposing (Msg(..))
import Html exposing (Html, text)
import Html.Attributes exposing (value, class, type_)
import Html.Events exposing (..)
import Game exposing (Game, GameForm)
import Bulma exposing (div)
import Bulma.Elements exposing (submit, title, form, submit, field, textInput, textArea, button, image, link, back)
import Bulma.Layout exposing (hero, container, section)
import Bulma.Components exposing (nav)
import Bulma.Grid exposing (column)
import GraphQL.Client.Http as Http
import RemoteData exposing (RemoteData(..))
import View.Header exposing (closeButton)
import View.IconPicker as IconPicker

newGamePage : RemoteData Http.Error Game -> GameForm -> Html Msg
newGamePage game gameForm =
  div "screen" [
    nav "has-shadow" [closeButton],
    hero "" [
      container "" [
        title "" [text "New Game"]
      ]
    ],
    section "" [
      container "" [
        column "" [
          iconPicker gameForm
        ],
        column "" [
          form_ game gameForm
        ]
      ]
    ]
  ]

iconPicker gameForm =
  let
      onIconSelect = \icon -> UpdateGameForm {gameForm | icon = icon, showIconPicker = False}
      showIconPicker = UpdateGameForm {gameForm| showIconPicker = True}
  in
    case gameForm.showIconPicker of
      True ->
        IconPicker.render onIconSelect
      False ->
        button "is-image" showIconPicker [
          image "is-48x48" gameForm.icon
        ]


form_ : RemoteData Http.Error Game -> GameForm -> Html Msg
form_ game gameForm =
  let
    updateTitle title = UpdateGameForm {gameForm | title = title}
    updateDescription description = UpdateGameForm {gameForm | description = description}
    isLoading =
      case game of
        Loading -> " is-loading"
        _ -> ""
  in
    form "" (CreateGame gameForm) [
      field "Title" <| textInput "" gameForm.title updateTitle,
      field "Description" <| textArea "" gameForm.description updateDescription,
      submit ("button is-primary is-fullwidth" ++ isLoading) [ text "Create Game"]
    ]
