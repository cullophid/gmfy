module View.ActivityPage exposing (activityPage)

import App.Data exposing (Msg(..))
import Activity.Data exposing (Activity, ActivityMsg(..))
import Event.Data exposing (EventMsg(..))
import Html exposing (Html, text)
import Bulma exposing (div)
import Bulma.Elements exposing (button)
import Bulma.Layout exposing (hero)
import RemoteData exposing (RemoteData(..))
import GraphQL.Client.Http as Http
import View.Loader exposing (loadingScreen)
import View.Header exposing (header, backButton)
import View.NotFoundPage exposing(notFoundPage)

activityPage : RemoteData Http.Error Activity -> Html Msg
activityPage activity =
  case activity of
    NotAsked -> div "" []
    Loading -> loadingScreen "Fetching Activity"
    Failure err -> notFoundPage
    Success activity ->
      div "" [
      header "is-primary" activity.title backButton,
      content_ activity
    ]

content_ : Activity -> Html Msg
content_ activity =
  hero "" [
    button
      "is-primary"
      (EventMsg <| CompleteActivity activity.id)
      [text "Complete Activity"]
  ]
