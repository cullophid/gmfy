module Game.Data exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Variable as Var exposing (Variable)


import RemoteData exposing (RemoteData)
import GraphQL.Client.Http exposing (Error)
import User.Data as User exposing (User)
import Activity.Data as Activity exposing (ActivityListItem)
import Event.Data as Event exposing (EventListItem)

type GameMsg =
    GameTitle String
  | GameDescription String
  | SubmitGame GameForm
  | CreateGameSuccess Game
  | CreateGameFail Error
  | FetchGameListFail Error
  | FetchGameListSuccess (List GameListItem)
  | FetchGameFail Error
  | FetchGameSuccess Game

type alias GameList = RemoteData Error (List GameListItem)

type alias Game = {
  id: String,
  title: String,
  description: String,
  players: List User,
  activities: List ActivityListItem,
  log: List EventListItem
  }

type alias GameListItem = {
  id: String,
  title: String,
  description: String
}

type alias GameForm = {
  title: String,
  description: String
  }

gameSpec : ValueSpec NonNull ObjectType Game vars
gameSpec = object Game
  |> with (field "id" [] string)
  |> with (field "title" [] string)
  |> with (field "description" [] string)
  |> with (field "players" [] (list User.userSpec))
  |> with (field "activities" [] (list Activity.activityListItemSpec))
  |> with (field "log" [] (list Event.eventListItemSpec))

gameListItemSpec : ValueSpec NonNull ObjectType GameListItem vars
gameListItemSpec = object GameListItem
  |> with (field "id" [] string)
  |> with (field "title" [] string)
  |> with (field "description" [] string)

gameFormVar: Variable {b| gameForm: GameForm}
gameFormVar = Var.required "game" .gameForm
  <| Var.object "GameForm" [
    Var.field "title" .title Var.string,
    Var.field "description" .description Var.string
  ]


emptyGameForm : GameForm
emptyGameForm = {
  title = "",
  description = ""
  }
