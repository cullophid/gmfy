module Actions where
import Model exposing (..)
import History exposing (hash, setPath)
import Debug
import Task exposing (Task)

type Action
  = NoOp
  | SetGameTitle String
  | CreateGame Game
  | CreateTask GameTask
  | ShowTaskForm Bool
  | SetTaskTitle String
  | SetTaskDescription String
  | SetTaskValue Int
  | AddTask GameTask
  | Location String
  | CompleteTask GameTask

mailbox : Signal.Mailbox Action
mailbox =
  Signal.mailbox NoOp

address : Signal.Address Action
address =
  mailbox.address

signal : Signal Action
signal =
  Signal.map (Debug.log "Action: ") <| Signal.merge mailbox.signal <| Signal.map (\h -> Location h) <| Signal.dropRepeats hash


locationFilter : Action -> Maybe String
locationFilter a =
  case a of
    Location l -> Just l
    _ -> Nothing
