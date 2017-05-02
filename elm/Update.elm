module Update exposing (update)

import Game exposing (emptyGameForm)
import Focus exposing (Focus, set, (=>))
import Navigation
import App exposing (Model)
import Msg exposing (Msg(..))
import Modal exposing (Modal(..))
import Api
import Router
import Ports
import RemoteData exposing (RemoteData(..))

-- Foci
activityForm_ = Focus.create .activityForm (\f x -> {x | activityForm = f x.activityForm})
gameForm_ = Focus.create .gameForm (\f x -> {x | gameForm = f x.gameForm})
loginForm_ = Focus.create .loginForm (\f x -> {x | loginForm = f x.loginForm})
game_ = Focus.create .game (\f x -> {x | game = f x.game})
log_ = Focus.create .log (\f x -> {x | log = f x.log})
title_ = Focus.create .title (\f x -> {x | title = f x.title})
email_ = Focus.create .email (\f x -> {x | email = f x.email})
description_ = Focus.create .description (\f x -> {x | description = f x.description})
points_ = Focus.create .points (\f x -> {x | points = f x.points})

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    ClearError ->
      ({model | error = Nothing }, Cmd.none)
    CloseModal ->
      ({model | modal = Closed}, Cmd.none)

    -- Navigation
    UrlChange location ->
      Router.update location model
    NewUrl to ->
      (model, Navigation.newUrl to)
    ModifyUrl to ->
      (model, Navigation.modifyUrl to)
    Back ->
      let
        history = Maybe.withDefault [] <| Maybe.andThen List.tail <| List.tail model.history
      in
        ({model| history = history}, Navigation.back 1)

    -- Activity
    UpdateActivityForm activityForm ->
      ({model | activityForm = activityForm}, Cmd.none)
    CreateActivity activityForm ->
      (model , Api.createActivity activityForm)
    CreateActivityFail err ->
      ({model | activity = Failure err}, Cmd.none)
    CreateActivitySuccess activity ->
      ({model | activity = Success activity}, Navigation.back 1)
    FetchActivityFail err ->
      ({model | activity = Failure err}, Cmd.none)
    FetchActivitySuccess activity ->
      ({model | activity = Success activity}, Cmd.none)
    CompleteActivity activityId ->
      (model, Api.completeActivity activityId)
    CompleteActivityFail err ->
      ({model | error = Just err}, Cmd.none)
    CompleteActivitySuccess event ->
      ({model |
        game = RemoteData.map (Focus.update (log_) (\log -> event :: log)) model.game,
        modal = ActivityCompletedModal
        },
        Cmd.none )

    -- Auth
    UpdateLoginForm loginForm ->
      ({model | loginForm = loginForm}, Cmd.none)
    SendAuthEmail email ->
      (model, Api.sendAuthEmail email)
    SendAuthEmailFail err ->
      ({model | error = Just err}, Cmd.none)
    SendAuthEmailSuccess msg ->
      (model, Navigation.newUrl "/login/pending")
    LoginFail err ->
      ({model | error = Just err}, Cmd.none)
    LoginSuccess user ->
      ({model | user = Success user}, Navigation.newUrl "/")
    Logout ->
      ({model | user = NotAsked}, Cmd.batch [Ports.clearCookie "jwt", Navigation.newUrl "/login"])
    FetchSessionFail err ->
      ({model | user = Failure err}, Navigation.newUrl "/login")
    FetchSessionSuccess location user ->
      ({model | user = Success user}, Navigation.newUrl (location.pathname ++ location.hash ++ location.search))

    -- Game

    UpdateGameForm gameForm ->
      ({model | gameForm = gameForm }, Cmd.none)
    CreateGame gameForm ->
      (model, Api.createGame gameForm)
    CreateGameFail err ->
        ({ model | error = Just err }, Cmd.none)
    CreateGameSuccess game ->
      ({ model |
          game = Success game,
          gameForm = emptyGameForm
        } , Navigation.modifyUrl ("/games/" ++ game.id))
    FetchGameListFail err ->
      ({model|  gameList = Failure err}, Cmd.none)
      -- ({model| games = Failure err}, Cmd.none)
    FetchGameListSuccess games ->
      ({ model | gameList = Success games}, Cmd.none)
    FetchGameFail err ->
      ({model | game = Failure err }, Cmd.none)
    FetchGameSuccess game ->
      ({model | game = Success game }, Cmd.none)
    UpdateInviteForm inviteForm ->
      ({model | inviteForm = inviteForm}, Cmd.none)
    InvitePlayer gameId email ->
      (model, Api.invitePlayer gameId email)
    InvitePlayerFail err ->
      ({model | error = Just err}, Cmd.none)
    InvitePlayerSuccess msg ->
      (model, Navigation.back 1)
