module Update.User where
import Model exposing (Model)
import Model.User exposing (User)
import Actions exposing (Action)

user : Action -> Model -> Model
user action model =
  {model | user = updateUser action model.user}

updateUser : Action -> User -> User
updateUser action user =
  case action of
    _ -> user
