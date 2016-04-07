module Main where

import Html exposing (Html)
import Actions exposing (..)
import Model exposing (Model, emptyModel)
import View exposing (view)
import Update exposing (update)
import Task exposing (Task)
import History
import Json.Encode exposing (Value)
import Json.Decode exposing (decodeString)


main : Signal Html
main =
  Signal.map view model

model : Signal Model
model =
  Signal.map (Debug.log "MODEL") <| Signal.foldp update initialModel Actions.signal


initialModel : Model
initialModel =
  Maybe.withDefault emptyModel
    <| Maybe.andThen getStorage (Result.toMaybe << decodeString Model.decoder)


port updateURL : Signal (Task error ())
port updateURL =
  Signal.map History.setPath
    <| Signal.map (Debug.log "update url")
    <| Signal.dropRepeats
    <| Signal.filterMap
      (\(a, b) -> if a /= b then Just a else Nothing ) ""
    <| Signal.map2 (\a b -> (a, b)) History.hash
    <| Signal.map .url model




isBackAction action =
  case action of
    Back -> True
    _ -> False
port getStorage : Maybe String


port setStorage : Signal Value
port setStorage =
  Signal.map Model.encode model
