module Test where

import LocalStorage
import Html exposing (text)
import Task exposing (Task)


-- main =
--   text <| Maybe.withDefault "NOPE" <| LocalStorage.get "stuff"

main =
  text <| Maybe.withDefault "nope" <| Maybe.map .message <| LocalStorage.getJson "stuff"

port setData : Task error ()
port setData =
  LocalStorage.setJson "stuff" {message = "hello world"}
