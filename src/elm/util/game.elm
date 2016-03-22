module Util.Game where
import Model exposing (Game)
import Util.String exposing (toInt)
import Util.List exposing (find, last)
import String


getSelectedGame : String -> List Game -> Maybe Game
getSelectedGame location games =
  let
    gameId = Maybe.andThen (last (String.split "/" location)) toInt
  in
    case gameId of
      Just selected -> find (\{id} -> id == selected) games
      _ -> Nothing
