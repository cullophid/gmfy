module Update.Location where
import Actions

location action model =
  case action of
    Actions.Location location -> {model | location = location}
    Actions.CreateGame _ -> {model | location = "#games"}
    _ -> model
