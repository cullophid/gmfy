module Model where


type alias GameTask = {
  title : String,
  description : String,
  value : Int
}

type alias Game = {
  title : String,
  tasks : List GameTask
}

type alias Model = {
  newGame : {
    showNewTask: Bool,
    game : Game
  },
  newTask : GameTask,
  games : List Game,
  location : String
}

initialModel : Model
initialModel =
  {
    location  = "#home",
    newGame = {
      showNewTask = False,
      game = emptyGame
    },
    newTask = emptyTask,
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
