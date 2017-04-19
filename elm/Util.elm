module Util exposing (..)
import Dict exposing (Dict)

import Focus exposing (Focus)
import Json.Decode as Decode exposing (Decoder, string)
import Date exposing (Date)

indexWith : (a -> comparable) -> List a -> Dict comparable a
indexWith f list =
  Dict.fromList <| List.map (\x -> (f x, x)) list

title_ : Focus {a | title: b} b
title_ = Focus.create .title (\f x -> {x | title = f x.title})

description_ : Focus {a | description: b} b
description_ = Focus.create .description (\f x -> {x | description = f x.description})

points_ : Focus {a | points: b} b
points_ = Focus.create .points (\f x -> {x | points = f x.points})

dateDecoder : Decoder Date
dateDecoder =
  let
    decode datestring =
      case Date.fromString datestring of
        Err e -> Decode.fail e
        Ok date -> Decode.succeed date
  in
    Decode.andThen decode string

foldResult : (err -> b) -> (a -> b) -> Result err a -> b
foldResult error success result =
  case result of
    Err err -> error err
    Ok a -> success a
