module View exposing (view)
import App.Data exposing (Model, Msg)
import User.Data exposing (User)
import Html exposing (Html, text)
import Bulma exposing (div)
import Route.Data exposing (Route(..))
import View.GamesListPage exposing (gamesListPage)
import View.GamePage exposing (gamePage)
import View.NewGamePage exposing (newGamePage)
import View.NewActivityPage exposing (newActivityPage)
import View.ActivityPage exposing (activityPage)
import View.NotFoundPage exposing (notFoundPage)
import View.ErrorModal  exposing (errorModal)
import RemoteData exposing (RemoteData(..))
import View.Loader exposing (loadingScreen)
import InviteForm.View exposing (invitePlayerScreen)
import Auth.View exposing (loginPage, loginPendingPage)

view : Model -> Html Msg
view model =
  let
    { gameList,
      loginForm,
      game,
      user,
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
      case route of
        LoginRoute ->
          loginPage loginForm
        LoginPendingRoute ->
          loginPendingPage
        GameListRoute ->
          gamesListPage gameList
        GameRoute _ ->
          gamePage {user = user, game = game}
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
