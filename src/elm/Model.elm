module Model exposing (..)

type Msg
  = NoOp
  | Location String

type alias Game =
  { name : String
  , description : String
  , id : String
  }
type alias GameForm =
  { name : String
  , description : String
  }

type alias Model =
  { games : List Game
  , location: String
  , gameForm : GameForm
  }

init : (Model, Cmd Msg)
init =
  let state = {
    games = [],
    gameForm = {
      name = "",
      description = ""
    },
    location = ""
  }
  in (state, Cmd.none)
