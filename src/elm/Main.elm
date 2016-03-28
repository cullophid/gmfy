module Main where

import Html exposing (Html)
import Actions exposing (Action)
import Model exposing (Model, emptyModel)
import View exposing (view)
import Update exposing (update)
import Task exposing (Task)
import History exposing (setPath, hash)
import Json.Encode exposing (Value)
import Json.Decode exposing (decodeString)


main : Signal Html
main =
  Signal.map view model

model : Signal Model
model =
  Signal.foldp update initialModel Actions.signal


initialModel : Model
initialModel =
  Maybe.withDefault emptyModel <| getStorage `Maybe.andThen` (Result.toMaybe << decodeString Model.decoder)

port updateUrl : Signal (Task error ())
port updateUrl =
  Signal.map setPath
  <| Signal.dropRepeats
  <| Signal.map .location model


port getStorage : Maybe String

port setStorage : Signal Value
port setStorage =
  Signal.map Model.encode model
