module Update.User where
import Model exposing (Model)
import Actions exposing (Action)

user : Action -> Model -> Model
user action model =
  {model | user = updateUser action model.user}

updateUser : Action -> String -> String
updateUser action user =
  case action of
    _ -> user
