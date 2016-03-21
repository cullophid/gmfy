module Actions where
import Model exposing (..)
type Action
  = NoOp
  | SetGameTitle String
  | CreateGame Game
  | CreateTask GameTask
  | SetTaskTitle String
  | GoTo String

actions : Signal.Mailbox Action
actions = Signal.mailbox NoOp
