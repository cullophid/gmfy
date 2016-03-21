module Main where
import Actions exposing (Action, actions)
import Model exposing (Model, emptyModel)
import Html exposing (h1, text)
import View exposing (view)
import Update exposing (update)
import Debug
import Task exposing (Task)
import History exposing (setPath)

main =
  Signal.map view model

model : Signal Model
model =
  Signal.foldp update initialModel actions.signal

initialModel : Model
initialModel =
  Maybe.withDefault emptyModel getStorage

port updateUrl : Signal (Task error ())
port updateUrl =
  Signal.map setPath <| Signal.map .location model

port getStorage : Maybe Model

port setStorage : Signal Model
port setStorage = model
