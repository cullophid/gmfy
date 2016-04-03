module Model.Location where

import Dict exposing (Dict)
import Json.Decode exposing (Decoder, customDecoder)

type alias LocationData =
  { path : String
  , params : Dict String String
  }

type Location
  = Home
  | GamesList LocationData
  | NotFound


decoder : Decoder Location
decoder =
  Json.Decode.succeed Home

parse : String -> Location
parse path =
  case path of
    "#(/)?" ->
      Home
    "#/games" ->
      GamesList {path = path, params = Dict.empty}
    _ ->
      NotFound
