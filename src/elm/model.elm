module Model where



type alias Game = {
  title : String,
  tasks : List GameTask
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

type alias Model = {
  gameForm : GameForm,
  taskForm : TaskForm,
  games : List Game,
  location : String
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
    games = []
  }

emptyGame =
  {
    title = "",
    tasks = []
  }

emptyTask =
  {
    title = "",
    description = "",
    value = 10
  }
