module Actions where
import Model.Game exposing (Game)
import Model.Activity exposing (Activity)
import Model.Url exposing (Url)
import History exposing (hash, setPath)
import Debug

type Action
  = NoOp
  | SetGameTitle String
  | SetGameDescription String
  | CreateGame Game
  | CreateActivity Activity
  | SetActivityTitle String
  | SetActivityDescription String
  | SetActivityValue Int
  | AddActivity Activity
  | Navigate Url
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
  <| Signal.map (\h -> Navigate <| Model.Url.parse h)
  <| Signal.dropRepeats hash
