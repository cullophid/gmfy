module Model where

type alias Game = {
  id : Int,
  title : String,
  tasks : List GameTask,
  players: List Player
}

type alias GameForm = {
  game : Game
}

type alias GameTask = {
  title : String,
  description : String,
  value : Int
}

type alias TaskForm = {
  showTaskForm : Bool,
  task : GameTask
}

type alias User = {
  id: Int,
  firstname : String,
  lastname : String,
  email : String
}

type alias Player = (Int, Int)

type alias Model = {
  gameForm : GameForm,
  taskForm : TaskForm,
  games : List Game,
  location : String,
  user : User
}

emptyModel : Model
emptyModel =
  {
    location  = "#home",
    gameForm = {
      game = emptyGame
    },
    taskForm = {
      showTaskForm = False,
      task = emptyTask
    },
    games = [],
    user = emptyUser
  }

emptyGame =
  {
    id = 0,
    title = "",
    tasks = [],
    players = []
  }

emptyTask =
  {
    title = "",
    description = "",
    value = 10
  }

emptyUser =
  {
    id = 0,
    firstname = "",
    lastname = "",
    email = ""
  }
