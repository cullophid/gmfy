module View.InviteScreen exposing (invitePlayerScreen)
import Msg exposing (Msg(..))
import Game exposing (InviteForm)
import Html exposing (Html, text)
import Bulma exposing (div)
import Bulma.Elements exposing (form, field, textInput, submit, title)
import Bulma.Components exposing (nav)
import Bulma.Layout exposing (section, container, hero)
import View.Header exposing (closeButton)

type alias Props = {
  gameId: String,
  inviteForm: InviteForm
  }

invitePlayerScreen : Props -> Html Msg
invitePlayerScreen {gameId, inviteForm} =
  let
    updateEmail email = UpdateInviteForm {inviteForm | email = email}
  in
    div "screen" [
      nav "" [closeButton],
      hero "" [
        container "" [
          title "" [text "Invite Player"]
        ]
      ],
      section "" [
        container "" [
          form "" (InvitePlayer gameId inviteForm.email) [
            field "email" <| textInput "" inviteForm.email updateEmail,
            submit "button is-primary is-fullwidth" [text "Send"]

            ]
          ]
        ]
      ]
