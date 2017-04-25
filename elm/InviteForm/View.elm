module InviteForm.View exposing (invitePlayerScreen)
import App.Data exposing (Msg(..))
import InviteForm.Data exposing (InviteForm, InviteFormMsg(..))
import Html exposing (Html, text)
import Bulma exposing (div)
import Bulma.Elements exposing (form, field, textInput, submit)
import Bulma.Layout exposing (section, container)
import View.Header exposing (header, closeButton)

type alias Props = {
  gameId: String,
  inviteForm: InviteForm
  }

invitePlayerScreen : Props -> Html Msg
invitePlayerScreen {gameId, inviteForm} =
  div "screen" [
    header "" "InvitePlayer" closeButton,
    section "" [
      container "" [
        form "" (InviteFormMsg <| InvitePlayer gameId inviteForm.email) [
          field "email" <| textInput "" inviteForm.email (InviteFormMsg << InviteFormEmail),
          submit "button is-primary is-fullwidth" [text "Send"]

          ]
        ]
      ]
    ]
