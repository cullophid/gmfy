module Main where
import Actions exposing (Action)
import Model exposing (Model, emptyModel)
import Html exposing (h1, text)
import View exposing (view)
import Update exposing (update)
import Debug
import Task exposing (Task)
import History exposing (setPath, hash)

main =
  Signal.map view model

model : Signal Model
model =
  Signal.foldp update initialModel Actions.signal


initialModel : Model
initialModel =
  Maybe.withDefault emptyModel getStorage

port updateUrl : Signal (Task error ())
port updateUrl =
  Signal.map setPath
  <| Signal.dropRepeats
  <| Signal.map .location model


port getStorage : Maybe Model

port setStorage : Signal Model
port setStorage =
  model
