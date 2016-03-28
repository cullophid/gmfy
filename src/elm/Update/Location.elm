module Update.Location where
import Actions
import Actions exposing (..)
import Model exposing (Model)

location : Action -> Model -> Model
location action model =
  case action of
    Actions.Location location -> {model | location = location}
    Actions.CreateGame _ -> {model | location = "#games"}
    _ -> model
