module Model.Url where

import Dict exposing (Dict)
import Json.Decode exposing (Decoder, customDecoder)


type Url
  = Home
  | GamesList
  | GamePage
  | GameActivities String
  | NotFound String


decoder : Decoder Url
decoder =
  Json.Decode.succeed <| Home

parse : String -> Url
parse path =
  case path of
    "#$" ->
      Home
    "#/games" ->
      GamesList
    "#/games/my-game/activities" ->
      GameActivities "my-game"
    _ ->
      NotFound path

toString : Url -> String
toString url =
  case url of
    Home -> "#"
    GamesList -> "#/games"
    NotFound path -> path
    _ -> ""
