module Model exposing (..)

type Msg
  = NoOp

type alias Game =
  { name : String
  , description: String
  , id : String
  }

type alias Model =
  { games : List Game
  , location: String
  }

init : (Model, Cmd Msg)
init =
  ( { games = []
    , location = ""
    }
  , Cmd.none)
