module View.ActivityPage exposing (activityPage)

import Msg exposing (Msg(..))
import Activity exposing (Activity)
import Html exposing (Html, text)
import Bulma exposing (div)
import Bulma.Elements exposing (button, title, image)
import Bulma.Components exposing (media, mediaLeft, mediaContent, nav)
import Bulma.Layout exposing (section, container, hero)
import RemoteData exposing (RemoteData(..))
import GraphQL.Client.Http as Http
import View.Loader exposing (loadingScreen)
import View.Header exposing (backButton)
import View.NotFoundPage exposing(notFoundPage)

activityPage : RemoteData Http.Error Activity -> Html Msg
activityPage activity =
  case activity of
    NotAsked -> div "" []
    Loading -> loadingScreen "Fetching Activity"
    Failure err -> notFoundPage
    Success activity ->
      div "" [
      nav "has-shadow" [backButton],
      hero "" [
        container "" [
          media "" [
            mediaLeft "" [
              image "is-64x64" activity.icon
            ],
            mediaContent "" [
              title "" [text activity.title]
            ]
          ]
        ]
      ],
      section "" [
        container "" [
          button
            "is-primary"
            (CompleteActivity activity.id)
            [text "Complete Activity"]
        ]
      ]
    ]
