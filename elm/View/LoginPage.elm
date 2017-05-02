module View.LoginPage exposing (loginPage, loginPendingPage)

import Html exposing (Html, text)
import Auth exposing (LoginForm)
import Msg exposing (Msg(..))

import Bulma exposing (div, p)
import Bulma.Elements exposing (form, field, textInput, submit, title)
import Bulma.Components exposing (nav)
import Bulma.Layout exposing (container, section, hero)
import View.Header exposing (backButton)

loginPage : LoginForm -> Html Msg
loginPage loginForm =
  let
    updateEmail email = UpdateLoginForm {loginForm | email = email}
  in
  div "" [
    nav "" [],
    hero "" [
      container "" [
        title "" [text "Login"]
      ]
    ],
    section "" [
      container "" [
        form "" (SendAuthEmail loginForm.email) [
          field "email" <| textInput "" loginForm.email updateEmail,
          submit "button is-primary is-fullwidth" [text "Send Auth Email"]
        ]
      ]
    ]
  ]

loginPendingPage : Html Msg
loginPendingPage =
  div "" [
    nav "" [backButton],
    hero "" [
      container "" [
        title "" [text "Check your email"]
      ]
    ],
    section "" [
      container "" [
        p "" [text "We have sent you an authentication link. Please check your email"]
      ]
    ]

  ]
