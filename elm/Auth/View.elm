module Auth.View exposing (loginPage, loginPendingPage)

import Html exposing (Html, text)
import Auth.Data exposing (LoginForm, AuthMsg(..))
import App exposing (Msg(..))

import Bulma exposing (div, p)
import Bulma.Elements exposing (form, field, textInput, submit)
import Bulma.Layout exposing (container, section)
import View.Header exposing (header, backButton)

loginPage : LoginForm -> Html Msg
loginPage {email} =
  div "" [
    header "" "Login" (div "" []),
    section "" [
      container "" [
        form "" (AuthMsg <| SendAuthEmail email) [
          field "email" <| textInput "" email (AuthMsg << LoginFormEmail),
          submit "button is-primary is-fullwidth" [text "Send Auth Email"]
        ]
      ]
    ]

  ]

loginPendingPage : Html Msg
loginPendingPage =
  div "" [
    header "" "Check your email" backButton,
    section "" [
      container "" [
        p "" [text "We have sent you an authentication link. Please check your email"]
      ]
    ]

  ]
