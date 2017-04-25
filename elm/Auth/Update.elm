module Auth.Update exposing (update)

import Auth.Data exposing (AuthMsg(..))
import Auth.Api as Api
import App.Data exposing (Model, Msg)
import GraphQL.Client.Http exposing (Error(..))
import RemoteData exposing (RemoteData(..))
import Navigation

update : AuthMsg -> Model -> (Model, Cmd Msg)
update msg model =
  let
      {loginForm} = model
  in
    case msg of
      LoginFormEmail email ->
        ({model| loginForm =
            {loginForm | email = email }
          }, Cmd.none)
      SendAuthEmail email ->
        (model, Cmd.batch [Api.sendAuthEmail email, Navigation.newUrl "/login/pending"])
      SendAuthEmailFail err ->
        ({model | error = Just (HttpError err)}, Cmd.none)
      SendAuthEmailSuccess msg ->
        (model, Cmd.none)
      LoginFail err ->
        ({model | error = Just (HttpError err)}, Cmd.none)
      LoginSuccess user ->
        ({model | user = Success user}, Navigation.newUrl "/")
