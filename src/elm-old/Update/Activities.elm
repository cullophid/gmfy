module Update.Activities where

import Actions exposing (..)
import Dict

activities action model =
  case action of
    DeleteActivity gameId activityId ->
      updateGame gameId (\game -> {game| activities = Dict.remove activityId game.activities}) model
    _ -> model


updateGame id f model =
    let {games} = model
    in
      { model
      | games = Dict.update id (Maybe.map f) games
      }
