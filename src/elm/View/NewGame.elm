module View.NewGame exposing (render)
import Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class, value, type', href)

render : {location: String, gameForm : GameForm} -> Html Msg
render {location, gameForm} =
  let
    isNewGamePage = location == "#/games/new"
    containerClass = if isNewGamePage
      then "bg-success page"
      else "fixed-bottom-right btn btn-success anim-from-right"
  in
    div [class containerClass] [
      if isNewGamePage
      then newGameForm gameForm
      else newGameButton
    ]

newGameButton : Html Msg
newGameButton =
  a [
    href "#/games/new"
  ] [text "New Game"]

newGameForm : GameForm -> Html Msg
newGameForm {name, description} =
  text "New Game Form"
