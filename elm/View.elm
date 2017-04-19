module View exposing (view)
import App exposing (Model, Msg)
import Html exposing (div, Html)
import View.GamesListPage exposing (gamesListPage)
import View.GamePage exposing (gamePage)
import View.GameFormPage exposing (gameFormPage)
import View.ActivityFormPage exposing (activityFormPage)
import View.ActivityPage exposing (activityPage)

view : Model -> Html Msg
view model =
  let
    { games,
      activities,
      route,
      history,
      gameForm,
      activityForm,
      events
    } = model
    hash = Maybe.withDefault "#Activities" <| Maybe.map .hash <| List.head history
  in
    div [] [
      gamesListPage route games,
      gamePage route hash games activities events,
      gameFormPage route gameForm,
      activityFormPage route activityForm,
      activityPage route activities
    ]
