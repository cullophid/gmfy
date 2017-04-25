module InviteForm.Data exposing (..)

import GraphQL.Client.Http as Http

type alias InviteForm = {
  email: String
}

emptyInviteForm : InviteForm
emptyInviteForm = {
  email = ""
  }

type InviteFormMsg =
    InvitePlayer String String
  | InvitePlayerFail Http.Error
  | InvitePlayerSuccess String
  | InviteFormEmail String
