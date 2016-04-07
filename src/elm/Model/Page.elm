module Model.Page where

import String
import Regex exposing (contains, regex)
import Dict exposing (Dict)
import Util.List exposing (nth, find)
import Json.Decode exposing (Decoder, customDecoder)


type Page
  = Home
  | GamesList
  | Activity String String
  | GameActivities String
  | NewActivity String
  | NewGame
  | NotFound String


decoder : Decoder Page
decoder =
  Json.Decode.succeed <| Home

pathSegment i path =
  Maybe.withDefault "" (nth i <| String.split "/" path)

routes =
  [ ("^#/$", \_ -> Home)
  , ("^#/games$",  \_ -> GamesList)
  , ("^#/games/new$", \_ -> NewGame)
  , ("^#/games/(.*)/activities$", \path -> GameActivities (pathSegment 2 path))
  , ("^#/games/(.*)/activities/new$", \path -> NewActivity (pathSegment 2 path))
  , ("^#/games/(.*)/activities/(.*)$", \path -> Activity (pathSegment 2 path) (pathSegment 4 path))
  ]

fromUrl : String -> Page
fromUrl path =
  let
    route =
      find ((flip contains) path << regex << fst) routes
  in
    case route of
      Just (p, f) -> Debug.log "WTF IT WORKED" <| f path
      _ -> NotFound path

toString : Page -> String
toString url =
  case url of
    Home -> "#"
    GamesList -> "#/games"
    NotFound path -> path
    _ -> ""
