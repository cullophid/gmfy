module View.GameFormPage exposing (gameFormPage)
import App exposing (Msg(..))
import Route exposing (Route(..))
import Html exposing (Html, div, form, h1, h2, text, label, input, textarea, button)
import Html.Attributes exposing (value, class, type_)
import Html.Events exposing (..)
import Game exposing (GameForm, GameMsg(..))
import View.Link exposing (link)


gameFormPage : Route -> GameForm -> Html Msg
gameFormPage route gameForm =
  case route of
    NewGameRoute ->
      div [class "page-overlay page-overlay-show bg-success"] [ content gameForm ]
    _ ->
      div [class "page-overlay page-overlay-hide bg-success"] [ content gameForm ]

content : GameForm -> Html Msg
content gameForm =
  div [class "col-md-6 col-md-offset-3 full-height"] [
    form [onSubmit (GameMsg <| SubmitGame gameForm), class "full-height flex-column"] [
      div [class "flex-grow-1 large-gutter-top"] [
        h1 [] [text "New Game"],
        div [class "form-group"] [
          label [] [text "Title"],
          input [
            class "form-control",
            value gameForm.title,
            onInput (GameMsg << GameTitle)
          ] []
        ],
        div [class "form-group"] [
          label [] [text "Description"],
          textarea [
            class "form-control",
            value gameForm.description,
            onInput (GameMsg << GameDescription)
          ] []
        ]
      ],
      div [ class "row flex-grow-0 gutter-top gutter-bottom"] [
        div [class "col-xs-6"] [
          link "/games" [class "btn btn-white-outline btn-block"] [ text "cancel"]
        ],
        div [class "col-xs-6"] [
          button [
            type_ "submit",
            class "btn btn-white-outline btn-block "
          ] [text "Create Game"]
        ]
      ]
    ]
  ]
