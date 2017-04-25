module InviteForm.Update exposing (..)

import App exposing (Model, Msg(..))
import InviteForm.Types exposing (InviteFormMsg(..))
import Api

update : InviteFormMsg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    InviteFormEmail email ->
      let
          inviteForm = model.inviteForm
      in
        ({model| inviteForm =
          { inviteForm | email = email }
        }, Cmd.none)
    InvitePlayer gameId email ->
      (model, Api.invitePlayer gameId email)
    InvitePlayerFail err ->
      ({model | error = Just err}, Cmd.none)
    InvitePlayerSuccess msg ->
      (model, Cmd.none)
