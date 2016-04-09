module Update.Games where
import Actions
import Util.List exposing (last, updateById)
import String
import Util
import Dict
import Model exposing (Model)
import Model.Game exposing (Game)
import Model.Page as Page
import Actions exposing (..)

games : Action -> Model -> Model
games action model =
    let
      {page, games, user} =
        model
      gameId =
        case page of
          Page.GameActivities id -> id
          Page.GamePlayers id -> id
          Page.Activity id _ -> id
          Page.NewActivity id -> id
          _ -> ""
    in
      case action of
        CreateGame newGame ->
          let game = Util.addId newGame
          in
            {model | games = Dict.insert game.id game games }
        CompleteActivity {value} ->
          { model
          | games = Dict.update gameId (Maybe.map (updatePlayerScore user.id value)) games
          }
        AddActivity gameId newActivity ->
          let
            activity = Util.addId newActivity
          in
            { model
            | games = Dict.update gameId (Maybe.map (\game -> {game| activities = Dict.insert activity.id activity game.activities})) games
            }
        _ -> model


updatePlayerScore : String -> Int -> Game -> Game
updatePlayerScore id value game =
  let
    {players} = game
  in
    { game
    | players = Dict.update id (Maybe.map (\player -> Debug.log "PlayerScore" {player | score = value + player.score})) players
    }
