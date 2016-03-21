module Main where
import Actions exposing (Action, actions)
import Model exposing (Model, initialModel)
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

port updateUrl : Signal (Task error ())
port updateUrl =
  Signal.map setPath <| Signal.map .location model
