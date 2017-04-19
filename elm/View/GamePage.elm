module View.GamePage exposing (gamePage)
import Html exposing (Html, div, h1, text, p, span, h3)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import RemoteData exposing (RemoteData(..))
import Game exposing (Game, Games)
import App exposing (Msg(..))
import Route exposing (Route(..))
import Activity exposing (Activity, Activities, ActivityMsg(..))
import Event exposing (Event, Events, EventMsg(..), EventType(..))
import View.Link exposing (link, back)
import View.Loader exposing (loader)
import View.Tabs exposing (tabs, Tab(..))
import Dict exposing (Dict)

gamePage : Route -> String -> Games -> Activities -> Events -> Html Msg
gamePage route hash games activities events =
  let
    selectedTab = String.dropLeft 1 hash
  in
    case route of
      GameRoute gameId ->
        let
          game = RemoteData.toMaybe games |> Maybe.andThen (Dict.get gameId)
        in
          gamePageContent game selectedTab activities events
      _ -> div [class "screen screen-hide"] []

gamePageContent : Maybe Game -> String -> Activities -> Events -> Html Msg
gamePageContent game selectedTab activities events =
  case game of
    Nothing -> div [] []
    Just {title, description, id} ->
      div [class "screen bg-gray-lighter"] [
        div [class "col-md-6 col-md-offset-3 large-gutter-top gutter-bottom"] [
          h1 [] [text title],
          p [] [text description],
          userScore events activities "4f496a48-8ad1-414c-b56d-f70b11fb472b"
        ],
        tabs selectedTab [
          Tab "Activities" <| div [class "col-md-6 col-md-offset-3 gutter-top gutter-bottom"] [
            activitiesList activities
          ],
          Tab "Events" <| div [class "col-md-6 col-md-offset-3 gutter-top gutter-bottom"] [
            eventList events
          ]
        ],
        back [class "btn btn-white-outline floating-back-button"] [
          span [class "fa fa-arrow-left"] []
        ],
        link ("/games/" ++ id ++ "/activities/new") [
            class "fixed-bottom-right btn btn-success"
          ]
          [ text "New Activity"]
      ]

eventList : Events -> Html Msg
eventList events =
  let
    event {eventType, user, activity, time} =
      div [class "anim-fold-in card card-block bg-white"] [
        h3 [] [text (toString eventType), text " : ", text activity],
        p [] [text user],
        p [] [text (toString time)]
      ]
  in
    case events of
      Loading -> loader
      Success events ->
        div [class "anim-list-stagger"]
          <| List.map event <| Dict.values events
      _ -> div [] []

activitiesList : Activities -> Html Msg
activitiesList activities =
  case activities of
    Loading -> loader
    Success activities ->
      div [class "anim-list-stagger"]
        <| List.map activity <| Dict.values activities
    _ -> div [] []


activity : Activity -> Html Msg
activity {title, description, id} =
  div [
      class "anim-fold-in card card-block bg-white",
      onClick (ActivityMsg <| CompleteActivity id)

    ] [
    h3 [] [text title],
    p [] [text description]
  ]

userScore : Events -> Activities -> String -> Html Msg
userScore events activities userId =
  case RemoteData.map2 (,) events activities of
    Loading -> loader
    Success (events, activities) ->
      p [] [text "User Score: ", text <| toString <| calculateScore events activities userId]
    _ -> div [] []

calculateScore : Dict String Event -> Dict String Activity -> String -> Int
calculateScore events activities userId =
  let
      getEventScore = Maybe.withDefault 0 << (\{activity} -> Maybe.map .points <| Dict.get activity activities)
  in

    List.filter (\{user, eventType} -> user == userId && eventType == ActivityCompleted) (Dict.values events)
      |> List.map getEventScore
      |> List.foldl (+) 0
