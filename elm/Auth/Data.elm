module Auth.Data exposing (..)

import User.Data exposing (User)
import Http

type alias LoginForm = { email:String }


type AuthMsg =
    LoginFormEmail String
  | LoginFail Http.Error
  | LoginSuccess User
  | SendAuthEmail String
  | SendAuthEmailFail Http.Error
  | SendAuthEmailSuccess String

emptyLoginForm = {email = ""}
