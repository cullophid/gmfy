module Model where

type alias Game =
  { id : String
  , title : String
  , description : String
  , tasks : List GameTask
  , players: List Player
  }


type alias GameTask =
  { id : String
  , title : String
  , description : String
  , value : Int
  }

type alias Player =
  { id : String
  , firstname : String
  , lastname: String
  , score : Int
  }

type alias Model =
  { showTaskForm: Bool
  , gameForm : Game
  , taskForm : GameTask
  , games : List Game
  , location : String
  , user : String
  }

emptyModel : Model
emptyModel =
  { location  = "#home"
  , gameForm = emptyGame
  , taskForm = emptyTask
  , games = []
  , user = ""
  , showTaskForm = False
  }

emptyGame : Game
emptyGame =
  { id = ""
  , title = ""
  , description = ""
  , tasks = []
  , players = []
  }


emptyPlayer : Player
emptyPlayer =
  { id = ""
  , firstname = ""
  , lastname = ""
  , score = 0
  }


emptyTask : GameTask
emptyTask =
  { id = ""
  , title = ""
  , description = ""
  , value = 10
  }
