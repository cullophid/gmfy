module Activity exposing (..)
import GraphQL.Client.Http as Http
import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Variable as Var exposing (Variable)

type alias ActivityListItem = {
  id: String,
  title: String,
  description: String,
  icon: String,
  points: Int
}

type alias Activity = {
  id: String,
  title: String,
  description: String,
  icon: String,
  game: { id: String },
  points: Int
}

type alias ActivityForm = {
  title : String,
  description: String,
  game: String,
  icon: String,
  points: Int,
  showIconPicker: Bool
  }

emptyActivityForm : String -> ActivityForm
emptyActivityForm game = {
  title = "",
  description = "",
  icon = "/images/icons/default_activity.svg",
  game = game,
  points = 10,
  showIconPicker = False
  }

activitySpec : ValueSpec NonNull ObjectType Activity vars
activitySpec = object Activity
  |> with (field "id" [] string)
  |> with (field "title" [] string)
  |> with (field "description" [] string)
  |> with (field "icon" [] string)
  |> with (field "game" [] (object (\id -> {id = id}) |> with (field "id" [] string)))
  |> with (field "points" [] int)

activityListItemSpec : ValueSpec NonNull ObjectType ActivityListItem vars
activityListItemSpec = object ActivityListItem
  |> with (field "id" [] string)
  |> with (field "title" [] string)
  |> with (field "description" [] string)
  |> with (field "icon" [] string)
  |> with (field "points" [] int)

activityFormVar: Variable {b| activityForm: ActivityForm}
activityFormVar = Var.required "activityForm" .activityForm
  <| Var.object "ActivityForm" [
    Var.field "title" .title Var.string,
    Var.field "description" .description Var.string,
    Var.field "icon" .icon Var.string,
    Var.field "game" .game Var.string,
    Var.field "points" .points Var.int
  ]
