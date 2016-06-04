module Actions where
import Model.Game exposing (Game)
import Model.Activity exposing (Activity)
import History exposing (hash, setPath)
import Debug
import Char exposing (KeyCode)
import Keyboard

type Action
  = NoOp
  | Back
  | SetGameTitle String
  | SetGameDescription String
  | CreateGame Game
  | DeleteGame String
  | SetActivityTitle String
  | SetActivityDescription String
  | SetActivityValue Int
  | AddActivity String Activity
  | DeleteActivity String String
  | Navigate String
  | CompleteActivity Activity
  | ToggleHeaderMenu Bool

mailbox : Signal.Mailbox Action
mailbox =
  Signal.mailbox NoOp

address : Signal.Address Action
address =
  mailbox.address

signal : Signal Action
signal =
  Signal.map (Debug.log "Action: ")
  <| Signal.merge mailbox.signal
  <| url


url : Signal Action
url =
  Signal.map Navigate
    <| Signal.dropRepeats hash
