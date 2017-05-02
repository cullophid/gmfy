module View exposing (view)
import App exposing (Model)
import Msg exposing (Msg(..))
import User exposing (User)
import Html exposing (Html, text)
import Bulma exposing (div)
import Router exposing (Route(..))
import View.GamesListPage exposing (gamesListPage)
import View.GamePage exposing (gamePage)
import View.NewGamePage exposing (newGamePage)
import View.NewActivityPage exposing (newActivityPage)
import View.ActivityPage exposing (activityPage)
import View.NotFoundPage exposing (notFoundPage)
import View.ErrorModal  exposing (errorModal)
import RemoteData exposing (RemoteData(..))
import View.Loader exposing (loadingScreen)
import View.InviteScreen exposing (invitePlayerScreen)
import View.LoginPage exposing (loginPage, loginPendingPage)
import Modal

view : Model -> Html Msg
view model =
  let
    { gameList,
      loginForm,
      game,
      user,
      modal,
      error,
      activity,
      route,
      history,
      inviteForm,
      gameForm,
      activityForm
    } = model
  in
    div "main" [
      errorModal error,
      Modal.render modal,
      case route of
        LoginRoute ->
          loginPage loginForm
        LoginPendingRoute ->
          loginPendingPage
        GameListRoute ->
          gamesListPage gameList
        GameRoute _ hash->
          gamePage {user = user, game = game, hash = hash}
        NewGameRoute ->
          newGamePage game gameForm
        NewActivityRoute _->
          newActivityPage activityForm
        ActivityRoute _ ->
          activityPage activity
        InvitePlayerRoute gameId ->
          invitePlayerScreen {gameId = gameId, inviteForm = inviteForm}
        NotFound ->
          notFoundPage
        _ -> div "" []
    ]
