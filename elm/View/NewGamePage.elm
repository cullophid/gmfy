module View.NewGamePage exposing (newGamePage)
import App exposing (Msg(..))
import Html exposing (Html, text)
import Html.Attributes exposing (value, class, type_)
import Html.Events exposing (..)
import Game exposing (Game, GameForm, GameMsg(..))
import Bulma exposing (link, back, div)
import Bulma.Elements exposing (submit, title, form, submit, field, textInput, textArea)
import Bulma.Layout exposing (hero, container, section)
import GraphQL.Client.Http as Http
import RemoteData exposing (RemoteData(..))
import View.Header exposing (header, closeButton)

newGamePage : RemoteData Http.Error Game -> GameForm -> Html Msg
newGamePage game gameForm =
  div "screen" [
    header "" "New Game" closeButton,
    section "" [
      container "" [
        form_ game gameForm
      ]
    ]
  ]

form_ : RemoteData Http.Error Game -> GameForm -> Html Msg
form_ game gameForm =
  let
    isLoading =
      case game of
        Loading -> " is-loading"
        _ -> ""
  in
    form "" (GameMsg <| SubmitGame gameForm) [
      field "Title" <| textInput "" gameForm.title (GameMsg << GameTitle),
      field "Description" <| textArea "" gameForm.description (GameMsg << GameDescription),
      submit ("button is-primary is-fullwidth" ++ isLoading) [ text "Create Game"]
    ]
