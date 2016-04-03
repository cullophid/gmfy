module Update.Navigate where
import Actions
import Actions exposing (..)
import Model exposing (Model)
import Model.Url
import String

navigate : Action -> Model -> Model
navigate action model =
  case action of
    Navigate location ->
      {model | location = location}

    CreateGame _ ->
      {model | location = Model.Url.parse "#games"}

    _ -> model


gotToCurrentGameActivities location =
  String.join "/"
    <| List.take 3
    <| String.split "/" location
