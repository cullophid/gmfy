module Game.Api exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg exposing (Value, variable)
import GraphQL.Request.Builder.Variable as Var exposing (Variable)
import GQL exposing (idVar, sendQuery, sendMutation)
import Game.Data exposing (GameForm, GameListItem, Game, GameMsg(..), gameSpec, gameListItemSpec, gameFormVar)
import App.Data exposing (Msg(..))
import Util exposing (foldResult)

getGame : String -> Cmd Msg
getGame gameId =
  let
    gameRequest=
      extract (field "game" [("id", idVar)] gameSpec)
  in
    sendQuery gameRequest {id = gameId}
      |> Cmd.map (GameMsg << foldResult FetchGameFail FetchGameSuccess)

getGameList : Cmd Msg
getGameList =
  let
    gameListRequest =
      extract (field "games" [] (list gameListItemSpec))
  in
    sendQuery gameListRequest {}
      |> Cmd.map (GameMsg << foldResult FetchGameListFail FetchGameListSuccess)

createGame : GameForm -> Cmd Msg
createGame gameForm =
  let
    createGameRequest =
      extract (field "createGame" [ ("gameForm", variable gameFormVar)] gameSpec)
  in
    sendMutation createGameRequest {gameForm = gameForm}
      |> Cmd.map (GameMsg << foldResult CreateGameFail CreateGameSuccess)
