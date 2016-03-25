module Update.TaskForm where
import Model exposing (Model, GameTask, emptyTask)
import Actions exposing (..)


taskForm : Action -> Model -> Model
taskForm action model =
  let
    {taskForm} = model
  in
    case action of
      ShowTaskForm bool ->
        {model | showTaskForm = bool}
      AddTask task ->
        { model
        | taskForm = emptyTask
        , showTaskForm = False
        }
      SetTaskTitle title ->
        { model | taskForm = {taskForm| title = title } }
      SetTaskDescription description ->
        { model | taskForm = {taskForm| description = description } }
      SetTaskValue value ->
        { model | taskForm = {taskForm| value = value } }
      _ -> model
