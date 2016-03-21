module Actions where
import Model exposing (..)
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
  | GoTo String

actions : Signal.Mailbox Action
actions = Signal.mailbox NoOp
