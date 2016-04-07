module Actions where
import Model.Game exposing (Game)
import Model.Activity exposing (Activity)
import History exposing (hash, setPath)
import Debug

type Action
  = NoOp
  | Back
  | SetGameTitle String
  | SetGameDescription String
  | CreateGame Game
  | SetActivityTitle String
  | SetActivityDescription String
  | SetActivityValue Int
  | AddActivity String Activity
  | Navigate String
  | CompleteActivity Activity

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
  <| Signal.map Navigate
  <| Signal.dropRepeats hash
