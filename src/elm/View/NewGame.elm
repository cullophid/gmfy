module View.NewGame exposing (render)
import Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class, value, type', href)

render {location, gameForm} =
  if location == "#/games/new"
  then newGameForm gameForm
  else newGameButton

newGameButton =
  a [
    class "fixed-bottom-right btn btn-success anim-from-right anim-delay-500",
    href "#/games/new"
  ] [text "New Game"]


newGameForm {id, name, description} =
  div [] [text "New Game Form"]
