module View.NewGame exposing (render)
import Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class, value, type', href)
import Html.Events exposing (onClick, onInput, onSubmit)
import View.Header as Header

render : {location: String, gameForm : GameForm} -> Html Msg
render {location, gameForm} =
  if location == "#/games/new"
  then newGameForm gameForm
  else newGameButton

newGameButton : Html Msg
newGameButton =
  a [
    class "fixed-bottom-right btn btn-success anim-from-right",
    href "#/games/new"
  ] [
    text "New Game"
  ]

newGameForm : GameForm -> Html Msg
newGameForm gameForm =
  div [ class "page bg-success anim-from-bottom"] [
    Header.render "New Game",
    div [class "col-md-6 col-md-offset-3"] [
      form [onSubmit (CreateGame gameForm)] [
        div [class "form-group"] [
          label [] [text "Title"],
          input [
            class "form-control",
            value gameForm.name,
            onInput GameFormTitle
          ] []
        ],
        div [class "form-group"] [
          label [] [text "Description"],
          textarea [
            class "form-control",
            value gameForm.description,
            onInput GameFormDescription
          ] []
        ],
        div [ class "row"] [
          div [class "col-xs-6"] [
            a [ type' "button",
                class "btn btn-danger btn-block ",
                href "#/"
            ] [text "Cancel"]
          ],
          div [class "col-xs-6"] [
            button [
              type' "button",
              class "btn btn-success btn-block ",
              onClick (CreateGame gameForm)
            ] [text "Create Game"]
          ]
        ]
      ]
    ]
  ]
