module Auth.Api exposing (sendAuthEmail, validateToken)
import App.Data exposing (Msg(..))
import Auth.Data exposing (AuthMsg(..))
import Http
import Util exposing (foldResult)
import User.Data exposing (userDecoder)
import Json.Decode exposing (string)
import Json.Encode as Encode

sendAuthEmail : String -> Cmd Msg
sendAuthEmail email =
  let
      body = Http.jsonBody
        <| Encode.object [
            ("email", Encode.string email)
          ]
  in
    Http.post "/api/auth" body string
      |> Http.send (AuthMsg << foldResult SendAuthEmailFail SendAuthEmailSuccess)

validateToken : String -> Cmd Msg
validateToken token =
  let
    body = Http.jsonBody
      <| Encode.object [
          ("token", Encode.string token)
        ]
  in
    Http.post "/api/login" body userDecoder
      |> Http.send (AuthMsg << foldResult LoginFail LoginSuccess)
