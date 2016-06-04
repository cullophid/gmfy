module Update.HeaderMenu where
import Actions exposing (..)
import Regex exposing (regex, contains)

headerMenu action model =
  case action of
    ToggleHeaderMenu toggled ->
      {model| showHeaderMenu = toggled}
    DeleteGame _ ->
      {model| showHeaderMenu = False}
    DeleteActivity _ _ ->
      {model| showHeaderMenu = False}
    Navigate _ ->
      {model| showHeaderMenu = False}
    _ -> model
