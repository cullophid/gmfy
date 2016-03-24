module Model where

type alias Game =
  { id : String
  , title : String
  , tasks : List (String, GameTask)
  , players: List (String, Player)
  }


type alias GameEntry =
  (String, Game)

type alias GameForm =
  { game : Game
  }

type alias GameTask =
  { id : String
  , title : String
  , description : String
  , value : Int
  }

type alias TaskEntry =
  (String, GameTask)

type alias TaskForm =
  { showTaskForm : Bool
  , task : GameTask
  }

type alias Player =
  { id : String
  , firstname : String
  , lastname: String
  , score : Int
  }

type alias PlayerEntry =
  (String, Player)

type alias Model =
  { gameForm : GameForm
  , taskForm : TaskForm
  , games : List (String, Game)
  , location : String
  , user : String
  }

emptyModel : Model
emptyModel =
  { location  = "#home"
  , gameForm =
      { game = emptyGame
      }
  , taskForm =
      { showTaskForm = False
      , task = emptyTask
      }
  , games = []
  , user = ""
  }

emptyGame =
  { id = ""
  , title = ""
  , tasks = []
  , players = []
  }

emptyPlayer =
  { id = ""
  , firstname = ""
  , lastname = ""
  , score = 0
  }

emptyTask =
  { id = ""
  , title = ""
  , description = ""
  , value = 10
  }
