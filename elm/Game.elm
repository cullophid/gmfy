module Game exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Variable as Var exposing (Variable)

import RemoteData exposing (RemoteData)
import GraphQL.Client.Http exposing (Error)
import User exposing (User)
import Activity exposing (ActivityListItem)
import Event exposing (EventListItem)

type alias GameList = RemoteData Error (List GameListItem)

type alias Game = {
  id: String,
  title: String,
  description: String,
  icon: String,
  players: List Player,
  activities: List ActivityListItem,
  log: List EventListItem
  }

type alias Player = {
  id: String,
  email : String,
  firstName : String,
  lastName : String
}

type alias GameListItem = {
  id: String,
  title: String,
  description: String,
  icon: String
}

type alias GameForm = {

  title: String,
  description: String,
  icon: String,
  showIconPicker: Bool
  }


type alias InviteForm = {
  email: String
}

emptyInviteForm : InviteForm
emptyInviteForm = {
  email = ""
  }

gameSpec : ValueSpec NonNull ObjectType Game vars
gameSpec = object Game
  |> with (field "id" [] string)
  |> with (field "title" [] string)
  |> with (field "description" [] string)
  |> with (field "icon" [] string)
  |> with (field "players" [] (list playerSpec))
  |> with (field "activities" [] (list Activity.activityListItemSpec))
  |> with (field "log" [] (list Event.eventListItemSpec))

playerSpec =
    object Player
  |> with (field "id" [] string)
  |> with (field "email" [] string)
  |> with (field "firstName" [] string)
  |> with (field "lastName" [] string)

gameListItemSpec : ValueSpec NonNull ObjectType GameListItem vars
gameListItemSpec = object GameListItem
  |> with (field "id" [] string)
  |> with (field "title" [] string)
  |> with (field "description" [] string)
  |> with (field "icon" [] string)

gameFormVar: Variable {b| gameForm: GameForm}
gameFormVar = Var.required "game" .gameForm
  <| Var.object "GameForm" [
    Var.field "title" .title Var.string,
    Var.field "description" .description Var.string,
    Var.field "icon" .icon Var.string
  ]

emptyGameForm : GameForm
emptyGameForm = {
  title = "",
  description = "",
  icon = "/images/icons/default_game.svg",
  showIconPicker = False
  }
