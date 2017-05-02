module Modal exposing (Modal(..), render)
import Html exposing (text)
import Bulma.Components exposing (modal)
import Bulma.Elements exposing (notification)
import Msg exposing (Msg(..))
type Modal =
    Closed
  | ActivityCompletedModal

render modalType =
  case modalType of
    Closed -> text ""
    ActivityCompletedModal -> activityCompletedModal

activityCompletedModal =
  modal "" [
    notification "is-success" CloseModal [
      text "Activity Completed!!! keep up the good work"
    ]
  ]
