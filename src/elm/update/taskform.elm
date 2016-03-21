module Update.TaskForm where
import Model exposing (Model, GameTask, TaskForm, emptyTask)
import Actions exposing (Action)


taskForm : Action -> Model -> Model
taskForm action model =
  {model | taskForm = updateForm action model.taskForm}

updateForm : Action -> TaskForm -> TaskForm
updateForm action taskForm =
  case action of
    Actions.ShowTaskForm bool -> { taskForm | showTaskForm = bool }
    Actions.AddTask _ -> {taskForm | showTaskForm = False, task = emptyTask}
    _ -> {taskForm | task = updateTask action taskForm.task}

updateTask : Action -> GameTask -> GameTask
updateTask action task =
  case action of
    Actions.SetTaskTitle title -> {task | title = title}
    Actions.SetTaskDescription description -> {task | description = description}
    Actions.SetTaskValue value -> {task | value = value}
    _ -> task
