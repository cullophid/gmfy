module Update.Games where
import Actions
import Util.List exposing (last, updateById)
import String
import Util
import Dict
import Model exposing (Model)
import Model.Game exposing (Game)
import Actions exposing (..)

games : Action -> Model -> Model
games action model =
    let
      {location, games, user} =
        model
      gameId =
        Maybe.withDefault "" <| Util.List.nth 1 <| String.split "/" location

      updateGame f =
        {model | games = Dict.update gameId (Maybe.map f) games}
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
        AddActivity newActivity ->
          let
            activity = Util.addId newActivity
          in
            updateGame (\game -> {game| activities = Dict.insert activity.id activity game.activities})
        _ -> model



updatePlayerScore : String -> Int -> Game -> Game
updatePlayerScore id value game =
  let
    {players} = game
  in
    { game
    | players = Dict.update id (Maybe.map (\player -> Debug.log "PlayerScore" {player | score = value + player.score})) players
    }
