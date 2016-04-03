module Update.Location where
import Actions
import Actions exposing (..)
import Model exposing (Model)
import Model.Location
import String

location : Action -> Model -> Model
location action model =
  case action of
    Location location ->
      {model | location = location}

    CreateGame _ ->
      {model | location = Model.Location.parse "#games"}

    _ -> model


gotToCurrentGameActivities location =
  String.join "/"
    <| List.take 3
    <| String.split "/" location
