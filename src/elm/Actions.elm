module Actions where
import Model.Game exposing (Game)
import Model.Activity exposing (Activity)
import History exposing (hash, setPath)
import Debug

type Action
  = NoOp
  | SetGameTitle String
  | SetGameDescription String
  | CreateGame Game
  | CreateActivity Activity
  | ShowActivityForm Bool
  | SetActivityTitle String
  | SetActivityDescription String
  | SetActivityValue Int
  | AddActivity Activity
  | Location String
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
  <| Signal.map (\h -> Location h)
  <| Signal.dropRepeats hash
